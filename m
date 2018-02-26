Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 17823786EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 07:55:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1Q7tN3Y027853
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 23:55:23 -0800 (PST)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.163.239) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.361.1; Sun, 25 Feb 2018 23:54:59 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Feb 2018 15:50:31 +0800
Message-ID: <20180226075031.17262-2-li.zhou@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20180226075031.17262-1-li.zhou@windriver.com>
References: <20180226075031.17262-1-li.zhou@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.239]
Subject: [meta-oe][PATCH 2/2] php: Security Advisory - php - CVE-2018-5712
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Feb 2018 07:55:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Porting the patch from <http://git.php.net/?p=3Dphp-src.git;a=3Dcommit;
h=3D73ca9b37731dd9690ffd9706333b17eaf90ea091> to solve CVE-2018-5712.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../php/php-7.1.9/CVE-2018-5712.patch              | 432 +++++++++++++++++=
++++
 meta-oe/recipes-devtools/php/php_7.1.9.bb          |   1 +
 2 files changed, 433 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5712.pa=
tch

diff --git a/meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5712.patch b/m=
eta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5712.patch
new file mode 100644
index 0000000..87ccc02
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5712.patch
@@ -0,0 +1,432 @@
+From fc2ac180fdaf4589c203802fff308fb8cbce58c6 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Sun, 11 Feb 2018 15:45:32 +0800
+Subject: [PATCH] Fix bug #74782: remove file name from output to avoid XSS
+
+Upstream-Status: Backport
+CVE: CVE-2018-5712
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ ext/phar/shortarc.php                             |  2 +-
+ ext/phar/stub.h                                   |  4 ++--
+ ext/phar/tests/cache_list/copyonwrite11.phar.phpt |  4 ++--
+ ext/phar/tests/phar_commitwrite.phpt              |  2 +-
+ ext/phar/tests/phar_convert_repeated.phpt         |  2 +-
+ ext/phar/tests/phar_create_in_cwd.phpt            |  2 +-
+ ext/phar/tests/phar_createdefaultstub.phpt        | 22 +++++++++++-------=
----
+ ext/phar/tests/phar_offset_check.phpt             |  4 ++--
+ ext/phar/tests/phar_setdefaultstub.phpt           | 20 ++++++++++--------=
--
+ ext/phar/tests/tar/phar_convert_phar.phpt         |  6 +++---
+ ext/phar/tests/tar/phar_convert_phar2.phpt        |  6 +++---
+ ext/phar/tests/tar/phar_convert_phar3.phpt        |  6 +++---
+ ext/phar/tests/tar/phar_convert_phar4.phpt        |  6 +++---
+ ext/phar/tests/zip/phar_convert_phar.phpt         |  6 +++---
+ 14 files changed, 46 insertions(+), 46 deletions(-)
+
+diff --git a/ext/phar/shortarc.php b/ext/phar/shortarc.php
+index 1bf3baa..e5ac8ba 100644
+--- a/ext/phar/shortarc.php
++++ b/ext/phar/shortarc.php
+@@ -74,7 +74,7 @@ if (@(isset($_SERVER['REQUEST_URI']) && isset($_SERVER['=
REQUEST_METHOD']) && ($_
+     $a =3D realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
+     if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
+         header('HTTP/1.0 404 Not Found');
+-        echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n=
 <body>\n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
++        echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n=
 <body>\n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
+         exit;
+     }
+     $b =3D pathinfo($a);
+diff --git a/ext/phar/stub.h b/ext/phar/stub.h
+index 28e3252..dd8baed 100644
+--- a/ext/phar/stub.h
++++ b/ext/phar/stub.h
+@@ -22,12 +22,12 @@ static inline zend_string* phar_get_stub(const char *i=
ndex_php, const char *web,
+ {
+ 	static const char newstub0[] =3D "<?php\n\n$web =3D '";
+ 	static const char newstub1_0[] =3D "';\n\nif (in_array('phar', stream_ge=
t_wrappers()) && class_exists('Phar', 0)) {\nPhar::interceptFileFuncs();\ns=
et_include_path('phar://' . __FILE__ . PATH_SEPARATOR . get_include_path())=
;\nPhar::webPhar(null, $web);\ninclude 'phar://' . __FILE__ . '/' . Extract=
_Phar::START;\nreturn;\n}\n\nif (@(isset($_SERVER['REQUEST_URI']) && isset(=
$_SERVER['REQUEST_METHOD']) && ($_SERVER['REQUEST_METHOD'] =3D=3D 'GET' || =
$_SERVER['REQUEST_METHOD'] =3D=3D 'POST'))) {\nExtract_Phar::go(true);\n$mi=
mes =3D array(\n'phps' =3D> 2,\n'c' =3D> 'text/plain',\n'cc' =3D> 'text/pla=
in',\n'cpp' =3D> 'text/plain',\n'c++' =3D> 'text/plain',\n'dtd' =3D> 'text/=
plain',\n'h' =3D> 'text/plain',\n'log' =3D> 'text/plain',\n'rng' =3D> 'text=
/plain',\n'txt' =3D> 'text/plain',\n'xsd' =3D> 'text/plain',\n'php' =3D> 1,=
\n'inc' =3D> 1,\n'avi' =3D> 'video/avi',\n'bmp' =3D> 'image/bmp',\n'css' =
=3D> 'text/css',\n'gif' =3D> 'image/gif',\n'htm' =3D> 'text/html',\n'html' =
=3D> 'text/html',\n'htmls' =3D> 'text/html',\n'ico' =3D> 'image/x-ico',\n'j=
pe' =3D> 'image/jpeg',\n'jpg' =3D> 'image/jpeg',\n'jpeg' =3D> 'image/jpeg',=
\n'js' =3D> 'application/x-javascript',\n'midi' =3D> 'audio/midi',\n'mid' =
=3D> 'audio/midi',\n'mod' =3D> 'audio/mod',\n'mov' =3D> 'movie/quicktime',\=
n'mp3' =3D> 'audio/mp3',\n'mpg' =3D> 'video/mpeg',\n'mpeg' =3D> 'video/mpeg=
',\n'pdf' =3D> 'application/pdf',\n'png' =3D> 'image/png',\n'swf' =3D> 'app=
lication/shockwave-flash',\n'tif' =3D> 'image/tiff',\n'tiff' =3D> 'image/ti=
ff',\n'wav' =3D> 'audio/wav',\n'xbm' =3D> 'image/xbm',\n'xml' =3D> 'text/xm=
l',\n);\n\nheader(\"Cache-Control: no-cache, must-revalidate\");\nheader(\"=
Pragma: no-cache\");\n\n$basename =3D basename(__FILE__);\nif (!strpos($_SE=
RVER['REQUEST_URI'], $basename)) {\nchdir(Extract_Phar::$temp);\ninclude $w=
eb;\nreturn;\n}\n$pt =3D substr($_SERVER['REQUEST_URI'], strpos($_SERVER['R=
EQUEST_URI'], $basename) + strlen($basename));\nif (!$pt || $pt =3D=3D '/')=
 {\n$pt =3D $web;\nheader('HTTP/1.1 301 Moved Permanently');\nheader('Locat=
ion: ' . $_SERVER['REQUEST_URI'] . '/' . $pt);\nexit;\n}\n$a =3D realpath(E=
xtract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);\nif (!$a || strlen(dirname=
($a)) < strlen(";
+-	static const char newstub1_1[] =3D "Extract_Phar::$temp)) {\nheader('HTT=
P/1.0 404 Not Found');\necho \"<html>\\n <head>\\n  <title>File Not Found<t=
itle>\\n </head>\\n <body>\\n  <h1>404 - File \", $pt, \" Not Found</h1>\\n=
 </body>\\n</html>\";\nexit;\n}\n$b =3D pathinfo($a);\nif (!isset($b['exten=
sion'])) {\nheader('Content-Type: text/plain');\nheader('Content-Length: ' =
. filesize($a));\nreadfile($a);\nexit;\n}\nif (isset($mimes[$b['extension']=
])) {\nif ($mimes[$b['extension']] =3D=3D=3D 1) {\ninclude $a;\nexit;\n}\ni=
f ($mimes[$b['extension']] =3D=3D=3D 2) {\nhighlight_file($a);\nexit;\n}\nh=
eader('Content-Type: ' .$mimes[$b['extension']]);\nheader('Content-Length: =
' . filesize($a));\nreadfile($a);\nexit;\n}\n}\n\nclass Extract_Phar\n{\nst=
atic $temp;\nstatic $origdir;\nconst GZ =3D 0x1000;\nconst BZ2 =3D 0x2000;\=
nconst MASK =3D 0x3000;\nconst START =3D '";
++	static const char newstub1_1[] =3D "Extract_Phar::$temp)) {\nheader('HTT=
P/1.0 404 Not Found');\necho \"<html>\\n <head>\\n  <title>File Not Found<t=
itle>\\n </head>\\n <body>\\n  <h1>404 - File Not Found</h1>\\n </body>\\n<=
/html>\";\nexit;\n}\n$b =3D pathinfo($a);\nif (!isset($b['extension'])) {\n=
header('Content-Type: text/plain');\nheader('Content-Length: ' . filesize($=
a));\nreadfile($a);\nexit;\n}\nif (isset($mimes[$b['extension']])) {\nif ($=
mimes[$b['extension']] =3D=3D=3D 1) {\ninclude $a;\nexit;\n}\nif ($mimes[$b=
['extension']] =3D=3D=3D 2) {\nhighlight_file($a);\nexit;\n}\nheader('Conte=
nt-Type: ' .$mimes[$b['extension']]);\nheader('Content-Length: ' . filesize=
($a));\nreadfile($a);\nexit;\n}\n}\n\nclass Extract_Phar\n{\nstatic $temp;\=
nstatic $origdir;\nconst GZ =3D 0x1000;\nconst BZ2 =3D 0x2000;\nconst MASK =
=3D 0x3000;\nconst START =3D '";
+ 	static const char newstub2[] =3D "';\nconst LEN =3D ";
+ 	static const char newstub3_0[] =3D ";\n\nstatic function go($return =3D =
false)\n{\n$fp =3D fopen(__FILE__, 'rb');\nfseek($fp, self::LEN);\n$L =3D u=
npack('V', $a =3D fread($fp, 4));\n$m =3D '';\n\ndo {\n$read =3D 8192;\nif =
($L[1] - strlen($m) < 8192) {\n$read =3D $L[1] - strlen($m);\n}\n$last =3D =
fread($fp, $read);\n$m .=3D $last;\n} while (strlen($last) && strlen($m) < =
$L[1]);\n\nif (strlen($m) < $L[1]) {\ndie('ERROR: manifest length read was =
\"' .\nstrlen($m) .'\" should be \"' .\n$L[1] . '\"');\n}\n\n$info =3D self=
::_unpack($m);\n$f =3D $info['c'];\n\nif ($f & self::GZ) {\nif (!function_e=
xists('gzinflate')) {\ndie('Error: zlib extension is not enabled -' .\n' gz=
inflate() function needed for zlib-compressed .phars');\n}\n}\n\nif ($f & s=
elf::BZ2) {\nif (!function_exists('bzdecompress')) {\ndie('Error: bzip2 ext=
ension is not enabled -' .\n' bzdecompress() function needed for bz2-compre=
ssed .phars');\n}\n}\n\n$temp =3D self::tmpdir();\n\nif (!$temp || !is_writ=
able($temp)) {\n$sessionpath =3D session_save_path();\nif (strpos ($session=
path, \";\") !=3D=3D false)\n$sessionpath =3D substr ($sessionpath, strpos =
($sessionpath, \";\")+1);\nif (!file_exists($sessionpath) || !is_dir($sessi=
onpath)) {\ndie('Could not locate temporary directory to extract phar');\n}=
\n$temp =3D $sessionpath;\n}\n\n$temp .=3D '/pharextract/'.basename(__FILE_=
_, '.phar');\nself::$temp =3D $temp;\nself::$origdir =3D getcwd();\n@mkdir(=
$temp, 0777, true);\n$temp =3D realpath($temp);\n\nif (!file_exists($temp .=
 DIRECTORY_SEPARATOR . md5_file(__FILE__))) {\nself::_removeTmpFiles($temp,=
 getcwd());\n@mkdir($temp, 0777, true);\n@file_put_contents($temp . '/' . m=
d5_file(__FILE__), '');\n\nforeach ($info['m'] as $path =3D> $file) {\n$a =
=3D !file_exists(dirname($temp . '/' . $path));\n@mkdir(dirname($temp . '/'=
 . $path), 0777, true);\nclearstatcache();\n\nif ($path[strlen($path) - 1] =
=3D=3D '/') {\n@mkdir($temp . '/' . $path, 0777);\n} else {\nfile_put_conte=
nts($temp . '/' . $path, self::extractFile($path, $file, $fp));\n@chmod($te=
mp . '/' . $path, 0666);\n}\n}\n}\n\nchdir($temp);\n\nif (!$return) {\nincl=
ude self::START;\n}\n}\n\nstatic fun";
+ 	static const char newstub3_1[] =3D "ction tmpdir()\n{\nif (strpos(PHP_OS=
, 'WIN') !=3D=3D false) {\nif ($var =3D getenv('TMP') ? getenv('TMP') : get=
env('TEMP')) {\nreturn $var;\n}\nif (is_dir('/temp') || mkdir('/temp')) {\n=
return realpath('/temp');\n}\nreturn false;\n}\nif ($var =3D getenv('TMPDIR=
')) {\nreturn $var;\n}\nreturn realpath('/tmp');\n}\n\nstatic function _unp=
ack($m)\n{\n$info =3D unpack('V', substr($m, 0, 4));\n $l =3D unpack('V', s=
ubstr($m, 10, 4));\n$m =3D substr($m, 14 + $l[1]);\n$s =3D unpack('V', subs=
tr($m, 0, 4));\n$o =3D 0;\n$start =3D 4 + $s[1];\n$ret['c'] =3D 0;\n\nfor (=
$i =3D 0; $i < $info[1]; $i++) {\n $len =3D unpack('V', substr($m, $start, =
4));\n$start +=3D 4;\n $savepath =3D substr($m, $start, $len[1]);\n$start +=
=3D $len[1];\n   $ret['m'][$savepath] =3D array_values(unpack('Va/Vb/Vc/Vd/=
Ve/Vf', substr($m, $start, 24)));\n$ret['m'][$savepath][3] =3D sprintf('%u'=
, $ret['m'][$savepath][3]\n& 0xffffffff);\n$ret['m'][$savepath][7] =3D $o;\=
n$o +=3D $ret['m'][$savepath][2];\n$start +=3D 24 + $ret['m'][$savepath][5]=
;\n$ret['c'] |=3D $ret['m'][$savepath][4] & self::MASK;\n}\nreturn $ret;\n}=
\n\nstatic function extractFile($path, $entry, $fp)\n{\n$data =3D '';\n$c =
=3D $entry[2];\n\nwhile ($c) {\nif ($c < 8192) {\n$data .=3D @fread($fp, $c=
);\n$c =3D 0;\n} else {\n$c -=3D 8192;\n$data .=3D @fread($fp, 8192);\n}\n}=
\n\nif ($entry[4] & self::GZ) {\n$data =3D gzinflate($data);\n} elseif ($en=
try[4] & self::BZ2) {\n$data =3D bzdecompress($data);\n}\n\nif (strlen($dat=
a) !=3D $entry[0]) {\ndie(\"Invalid internal .phar file (size error \" . st=
rlen($data) . \" !=3D \" .\n$stat[7] . \")\");\n}\n\nif ($entry[3] !=3D spr=
intf(\"%u\", crc32($data) & 0xffffffff)) {\ndie(\"Invalid internal .phar fi=
le (checksum error)\");\n}\n\nreturn $data;\n}\n\nstatic function _removeTm=
pFiles($temp, $origdir)\n{\nchdir($temp);\n\nforeach (glob('*') as $f) {\ni=
f (file_exists($f)) {\nis_dir($f) ? @rmdir($f) : @unlink($f);\nif (file_exi=
sts($f) && is_dir($f)) {\nself::_removeTmpFiles($f, getcwd());\n}\n}\n}\n\n=
@rmdir($temp);\nclearstatcache();\nchdir($origdir);\n}\n}\n\nExtract_Phar::=
go();\n__HALT_COMPILER(); ?>";
+=20
+-	static const int newstub_len =3D 6633;
++	static const int newstub_len =3D 6623;
+=20
+ 	return strpprintf(name_len + web_len + newstub_len, "%s%s%s%s%s%s%d%s%s"=
, newstub0, web, newstub1_0, newstub1_1, index_php, newstub2, name_len + we=
b_len + newstub_len, newstub3_0, newstub3_1);
+ }
+diff --git a/ext/phar/tests/cache_list/copyonwrite11.phar.phpt b/ext/phar/=
tests/cache_list/copyonwrite11.phar.phpt
+index bf7367c..c1d3a42 100644
+--- a/ext/phar/tests/cache_list/copyonwrite11.phar.phpt
++++ b/ext/phar/tests/cache_list/copyonwrite11.phar.phpt
+@@ -18,5 +18,5 @@ echo strlen($p2->getStub()),"\n";
+ echo "ok\n";
+ __HALT_COMPILER(); ?>
+ "
+-6653
+-ok
+\ No newline at end of file
++6643
++ok
+diff --git a/ext/phar/tests/phar_commitwrite.phpt b/ext/phar/tests/phar_co=
mmitwrite.phpt
+index 6387835..cd9e52f 100644
+--- a/ext/phar/tests/phar_commitwrite.phpt
++++ b/ext/phar/tests/phar_commitwrite.phpt
+@@ -29,7 +29,7 @@ unlink(dirname(__FILE__) . '/brandnewphar.phar');
+ __HALT_COMPILER();
+ ?>
+ --EXPECT--
+-int(6651)
++int(6641)
+ string(200) "<?php
+ function __autoload($class)
+ {
+diff --git a/ext/phar/tests/phar_convert_repeated.phpt b/ext/phar/tests/ph=
ar_convert_repeated.phpt
+index b2ef195..99ff901 100644
+--- a/ext/phar/tests/phar_convert_repeated.phpt
++++ b/ext/phar/tests/phar_convert_repeated.phpt
+@@ -123,7 +123,7 @@ NULL
+ bool(true)
+ bool(false)
+ bool(false)
+-int(6651)
++int(6641)
+ NULL
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D convertToZip() =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ bool(false)
+diff --git a/ext/phar/tests/phar_create_in_cwd.phpt b/ext/phar/tests/phar_=
create_in_cwd.phpt
+index 83de7be..cafc8a1 100644
+--- a/ext/phar/tests/phar_create_in_cwd.phpt
++++ b/ext/phar/tests/phar_create_in_cwd.phpt
+@@ -32,7 +32,7 @@ __HALT_COMPILER();
+ unlink(dirname(__FILE__) . '/brandnewphar.phar');
+ ?>
+ --EXPECT--
+-int(6651)
++int(6641)
+ string(200) "<?php
+ function __autoload($class)
+ {
+diff --git a/ext/phar/tests/phar_createdefaultstub.phpt b/ext/phar/tests/p=
har_createdefaultstub.phpt
+index a8648dc..e074d64 100644
+--- a/ext/phar/tests/phar_createdefaultstub.phpt
++++ b/ext/phar/tests/phar_createdefaultstub.phpt
+@@ -34,7 +34,7 @@ echo $e->getMessage() . "\n";
+ ?>
+ =3D=3D=3DDONE=3D=3D=3D
+ --EXPECT--
+-string(6651) "<?php
++string(6641) "<?php
+=20
+ $web =3D 'index.php';
+=20
+@@ -110,7 +110,7 @@ exit;
+ $a =3D realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
+ if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
+ header('HTTP/1.0 404 Not Found');
+-echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n <body>\=
n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
++echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n <body>\=
n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
+ exit;
+ }
+ $b =3D pathinfo($a);
+@@ -144,7 +144,7 @@ const GZ =3D 0x1000;
+ const BZ2 =3D 0x2000;
+ const MASK =3D 0x3000;
+ const START =3D 'index.php';
+-const LEN =3D 6653;
++const LEN =3D 6643;
+=20
+ static function go($return =3D false)
+ {
+@@ -328,7 +328,7 @@ Extract_Phar::go();
+ __HALT_COMPILER(); ?>"
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+-string(6662) "<?php
++string(6652) "<?php
+=20
+ $web =3D 'index.php';
+=20
+@@ -404,7 +404,7 @@ exit;
+ $a =3D realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
+ if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
+ header('HTTP/1.0 404 Not Found');
+-echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n <body>\=
n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
++echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n <body>\=
n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
+ exit;
+ }
+ $b =3D pathinfo($a);
+@@ -438,7 +438,7 @@ const GZ =3D 0x1000;
+ const BZ2 =3D 0x2000;
+ const MASK =3D 0x3000;
+ const START =3D 'my/custom/thingy.php';
+-const LEN =3D 6664;
++const LEN =3D 6654;
+=20
+ static function go($return =3D false)
+ {
+@@ -622,7 +622,7 @@ Extract_Phar::go();
+ __HALT_COMPILER(); ?>"
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+-int(7042)
++int(7032)
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+ Illegal filename passed in for stub creation, was 401 characters long, an=
d only 400 or less is allowed
+@@ -630,7 +630,7 @@ Illegal filename passed in for stub creation, was 401 =
characters long, and only
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+-string(6664) "<?php
++string(6654) "<?php
+=20
+ $web =3D 'the/web.php';
+=20
+@@ -706,7 +706,7 @@ exit;
+ $a =3D realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
+ if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
+ header('HTTP/1.0 404 Not Found');
+-echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n <body>\=
n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
++echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n <body>\=
n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
+ exit;
+ }
+ $b =3D pathinfo($a);
+@@ -740,7 +740,7 @@ const GZ =3D 0x1000;
+ const BZ2 =3D 0x2000;
+ const MASK =3D 0x3000;
+ const START =3D 'my/custom/thingy.php';
+-const LEN =3D 6666;
++const LEN =3D 6656;
+=20
+ static function go($return =3D false)
+ {
+@@ -924,6 +924,6 @@ Extract_Phar::go();
+ __HALT_COMPILER(); ?>"
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+-int(7042)
++int(7032)
+ Illegal web filename passed in for stub creation, was 401 characters long=
, and only 400 or less is allowed
+ =3D=3D=3DDONE=3D=3D=3D
+diff --git a/ext/phar/tests/phar_offset_check.phpt b/ext/phar/tests/phar_o=
ffset_check.phpt
+index a4a65e9..7609f20 100644
+--- a/ext/phar/tests/phar_offset_check.phpt
++++ b/ext/phar/tests/phar_offset_check.phpt
+@@ -70,8 +70,8 @@ var_dump($phar->getAlias());
+ Entry .phar/stub.php does not exist
+ Entry .phar/alias.txt does not exist
+ Cannot set stub ".phar/stub.php" directly in phar "%sphar_offset_check.ph=
ar.php", use setStub
+-int(6653)
+-int(6653)
++int(6643)
++int(6643)
+ Cannot set alias ".phar/alias.txt" directly in phar "%sphar_offset_check.=
phar.php", use setAlias
+ string(5) "susan"
+ string(5) "susan"
+diff --git a/ext/phar/tests/phar_setdefaultstub.phpt b/ext/phar/tests/phar=
_setdefaultstub.phpt
+index a36c005..fc7143a 100644
+--- a/ext/phar/tests/phar_setdefaultstub.phpt
++++ b/ext/phar/tests/phar_setdefaultstub.phpt
+@@ -54,7 +54,7 @@ try {
+ unlink(dirname(__FILE__) . '/' . basename(__FILE__, '.clean.php') . '.pha=
r');
+ ?>
+ --EXPECT--
+-string(6653) "<?php
++string(6643) "<?php
+=20
+ $web =3D 'index.php';
+=20
+@@ -130,7 +130,7 @@ exit;
+ $a =3D realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
+ if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
+ header('HTTP/1.0 404 Not Found');
+-echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n <body>\=
n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
++echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n <body>\=
n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
+ exit;
+ }
+ $b =3D pathinfo($a);
+@@ -164,7 +164,7 @@ const GZ =3D 0x1000;
+ const BZ2 =3D 0x2000;
+ const MASK =3D 0x3000;
+ const START =3D 'index.php';
+-const LEN =3D 6653;
++const LEN =3D 6643;
+=20
+ static function go($return =3D false)
+ {
+@@ -349,7 +349,7 @@ __HALT_COMPILER(); ?>
+ "
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+-string(6664) "<?php
++string(6654) "<?php
+=20
+ $web =3D 'index.php';
+=20
+@@ -425,7 +425,7 @@ exit;
+ $a =3D realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
+ if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
+ header('HTTP/1.0 404 Not Found');
+-echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n <body>\=
n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
++echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n <body>\=
n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
+ exit;
+ }
+ $b =3D pathinfo($a);
+@@ -459,7 +459,7 @@ const GZ =3D 0x1000;
+ const BZ2 =3D 0x2000;
+ const MASK =3D 0x3000;
+ const START =3D 'my/custom/thingy.php';
+-const LEN =3D 6664;
++const LEN =3D 6654;
+=20
+ static function go($return =3D false)
+ {
+@@ -644,7 +644,7 @@ __HALT_COMPILER(); ?>
+ "
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+-string(6666) "<?php
++string(6656) "<?php
+=20
+ $web =3D 'the/web.php';
+=20
+@@ -720,7 +720,7 @@ exit;
+ $a =3D realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
+ if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
+ header('HTTP/1.0 404 Not Found');
+-echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n <body>\=
n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
++echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n <body>\=
n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
+ exit;
+ }
+ $b =3D pathinfo($a);
+@@ -754,7 +754,7 @@ const GZ =3D 0x1000;
+ const BZ2 =3D 0x2000;
+ const MASK =3D 0x3000;
+ const START =3D 'my/custom/thingy.php';
+-const LEN =3D 6666;
++const LEN =3D 6656;
+=20
+ static function go($return =3D false)
+ {
+@@ -939,6 +939,6 @@ __HALT_COMPILER(); ?>
+ "
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+-int(7044)
++int(7034)
+ Illegal filename passed in for stub creation, was 401 characters long, an=
d only 400 or less is allowed
+ =3D=3D=3DDONE=3D=3D=3D
+diff --git a/ext/phar/tests/tar/phar_convert_phar.phpt b/ext/phar/tests/ta=
r/phar_convert_phar.phpt
+index fce826a..c827c21 100644
+--- a/ext/phar/tests/tar/phar_convert_phar.phpt
++++ b/ext/phar/tests/tar/phar_convert_phar.phpt
+@@ -47,12 +47,12 @@ __HALT_COMPILER();
+ ?>
+ --EXPECT--
+ bool(false)
+-int(6651)
++int(6641)
+ bool(true)
+ string(60) "<?php // tar-based phar archive stub file
+ __HALT_COMPILER();"
+ bool(true)
+-int(6651)
++int(6641)
+ bool(true)
+-int(6651)
++int(6641)
+ =3D=3D=3DDONE=3D=3D=3D
+diff --git a/ext/phar/tests/tar/phar_convert_phar2.phpt b/ext/phar/tests/t=
ar/phar_convert_phar2.phpt
+index 496948b..e21a984 100644
+--- a/ext/phar/tests/tar/phar_convert_phar2.phpt
++++ b/ext/phar/tests/tar/phar_convert_phar2.phpt
+@@ -49,14 +49,14 @@ __HALT_COMPILER();
+ ?>
+ --EXPECT--
+ bool(false)
+-int(6651)
++int(6641)
+ bool(true)
+ string(60) "<?php // tar-based phar archive stub file
+ __HALT_COMPILER();"
+ bool(true)
+ int(4096)
+-int(6651)
++int(6641)
+ bool(true)
+ bool(true)
+-int(6651)
++int(6641)
+ =3D=3D=3DDONE=3D=3D=3D
+diff --git a/ext/phar/tests/tar/phar_convert_phar3.phpt b/ext/phar/tests/t=
ar/phar_convert_phar3.phpt
+index f476819..39cf120 100644
+--- a/ext/phar/tests/tar/phar_convert_phar3.phpt
++++ b/ext/phar/tests/tar/phar_convert_phar3.phpt
+@@ -49,14 +49,14 @@ __HALT_COMPILER();
+ ?>
+ --EXPECT--
+ bool(false)
+-int(6651)
++int(6641)
+ bool(true)
+ string(60) "<?php // tar-based phar archive stub file
+ __HALT_COMPILER();"
+ bool(true)
+ int(8192)
+-int(6651)
++int(6641)
+ bool(true)
+ bool(true)
+-int(6651)
++int(6641)
+ =3D=3D=3DDONE=3D=3D=3D
+diff --git a/ext/phar/tests/tar/phar_convert_phar4.phpt b/ext/phar/tests/t=
ar/phar_convert_phar4.phpt
+index 544b96b..3ad27dc 100644
+--- a/ext/phar/tests/tar/phar_convert_phar4.phpt
++++ b/ext/phar/tests/tar/phar_convert_phar4.phpt
+@@ -54,7 +54,7 @@ __HALT_COMPILER();
+ ?>
+ --EXPECT--
+ bool(false)
+-int(6651)
++int(6641)
+ string(2) "hi"
+ bool(true)
+ string(60) "<?php // tar-based phar archive stub file
+@@ -62,10 +62,10 @@ __HALT_COMPILER();"
+ string(2) "hi"
+ bool(true)
+ int(4096)
+-int(6651)
++int(6641)
+ string(2) "hi"
+ bool(true)
+ bool(true)
+-int(6651)
++int(6641)
+ string(2) "hi"
+ =3D=3D=3DDONE=3D=3D=3D
+diff --git a/ext/phar/tests/zip/phar_convert_phar.phpt b/ext/phar/tests/zi=
p/phar_convert_phar.phpt
+index 815656d..9cf942b 100644
+--- a/ext/phar/tests/zip/phar_convert_phar.phpt
++++ b/ext/phar/tests/zip/phar_convert_phar.phpt
+@@ -46,12 +46,12 @@ __HALT_COMPILER();
+ ?>
+ --EXPECT--
+ bool(false)
+-int(6651)
++int(6641)
+ bool(true)
+ string(60) "<?php // zip-based phar archive stub file
+ __HALT_COMPILER();"
+ bool(true)
+-int(6651)
++int(6641)
+ bool(true)
+-int(6651)
++int(6641)
+ =3D=3D=3DDONE=3D=3D=3D
+--=20
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.1.9.bb b/meta-oe/recipes-de=
vtools/php/php_7.1.9.bb
index 1d9e35a..374f345 100644
--- a/meta-oe/recipes-devtools/php/php_7.1.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.1.9.bb
@@ -6,6 +6,7 @@ SRC_URI +=3D "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch=
 \
             file://0001-Specify-tag-with-libtool.patch \
             file://CVE-2017-16642.patch \
             file://CVE-2018-5711.patch \
+            file://CVE-2018-5712.patch \
            "
 SRC_URI[md5sum] =3D "2397be54f3281cdf30c7ef076b28f7d0"
 SRC_URI[sha256sum] =3D "314dcc10dfdd7c4443edb4fe1e133a44f2b2a8351be8c9eb6a=
b9222d45fd9bae"
--=20
2.9.3


