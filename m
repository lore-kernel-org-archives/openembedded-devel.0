Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AFED265CBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2018 05:36:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w295ZNlN019628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 8 Mar 2018 21:35:38 -0800
Received: from [128.224.163.239] (128.224.163.239) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 8 Mar 2018 21:34:37 -0800
To: akuster808 <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180226075031.17262-1-li.zhou@windriver.com>
	<20180226075031.17262-2-li.zhou@windriver.com>
	<1b2ac28d-be01-fd0b-0f8e-0ab723e8c56a@gmail.com>
	<7f336a1f-8129-e442-3341-bf35dd09de66@windriver.com>
	<61ea2876-84d3-7340-6a06-a7800a56b671@gmail.com>
From: "Zhou, Li" <li.zhou@windriver.com>
Message-ID: <932ad620-6c52-8a01-3572-3c615e01a48c@windriver.com>
Date: Fri, 9 Mar 2018 13:30:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <61ea2876-84d3-7340-6a06-a7800a56b671@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/2] php: Security Advisory - php - CVE-2018-5712
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
X-List-Received-Date: Fri, 09 Mar 2018 05:36:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/08/2018 03:40 AM, akuster808 wrote:
>
> On 03/04/2018 09:08 PM, Zhou, Li wrote:
>>
>> On 03/04/2018 11:00 PM, akuster808 wrote:
>>> On 02/25/2018 11:50 PM, Li Zhou wrote:
>>>> Porting the patch from <http://git.php.net/?p=php-src.git;a=commit;
>>>> h=73ca9b37731dd9690ffd9706333b17eaf90ea091> to solve CVE-2018-5712.
>>>>
>>>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>>> This would not apply.
>>> can you double check?
>> I just downloaded the newest code and it can apply successfully.
>> Have you already applied the patch for CVE-2018-5711 which I sent
>> together with this patch?
> yes.
>
>> If yes, please give me more information about the failure. Thanks.
> ./contrib/pw-am.sh 148343
> 2018-03-07 11:39:39
> URL:https://patchwork.openembedded.org/patch/148343/mbox/ [24852] ->
> "pw-am-148343.patch" [1]
> Applying: php: Security Advisory - php - CVE-2018-5712
> .git/rebase-apply/patch:57: space before tab in indent.
>       static const char newstub0[] = "<?php\n\n$web = '";
> .git/rebase-apply/patch:58: space before tab in indent.
>       static const char newstub1_0[] = "';\n\nif (in_array('phar',
> stream_get_wrappers()) && class_exists('Phar', 0))
> {\nPhar::interceptFileFuncs();\nset_include_path('phar://' . __FILE__ .
> PATH_SEPARATOR . get_include_path());\nPhar::webPhar(null,
> $web);\ninclude 'phar://' . __FILE__ . '/' .
> Extract_Phar::START;\nreturn;\n}\n\nif (@(isset($_SERVER['REQUEST_URI'])
> && isset($_SERVER['REQUEST_METHOD']) && ($_SERVER['REQUEST_METHOD'] ==
> 'GET' || $_SERVER['REQUEST_METHOD'] == 'POST')))
> {\nExtract_Phar::go(true);\n$mimes = array(\n'phps' => 2,\n'c' =>
> 'text/plain',\n'cc' => 'text/plain',\n'cpp' => 'text/plain',\n'c++' =>
> 'text/plain',\n'dtd' => 'text/plain',\n'h' => 'text/plain',\n'log' =>
> 'text/plain',\n'rng' => 'text/plain',\n'txt' => 'text/plain',\n'xsd' =>
> 'text/plain',\n'php' => 1,\n'inc' => 1,\n'avi' => 'video/avi',\n'bmp' =>
> 'image/bmp',\n'css' => 'text/css',\n'gif' => 'image/gif',\n'htm' =>
> 'text/html',\n'html' => 'text/html',\n'htmls' => 'text/html',\n'ico' =>
> 'image/x-ico',
> .git/rebase-apply/patch:63: space before tab in indent.
>       static const char newstub2[] = "';\nconst LEN = ";
> .git/rebase-apply/patch:64: space before tab in indent.
>       static const char newstub3_0[] = ";\n\nstatic function go($return =
> false)\n{\n$fp = fopen(__FILE__, 'rb');\nfseek($fp, self::LEN);\n$L =
> unpack('V', $a = fread($fp, 4));\n$m = '';\n\ndo {\n$read = 8192;\nif
> ($L[1] - strlen($m) < 8192) {\n$read = $L[1] - strlen($m);\n}\n$last =
> fread($fp, $read);\n$m .= $last;\n} while (strlen($last) && strlen($m) <
> $L[1]);\n\nif (strlen($m) < $L[1]) {\ndie('ERROR: manifest length read
> was \"' .\nstrlen($m) .'\" should be \"' .\n$L[1] . '\"');\n}\n\n$info =
> self::_unpack($m);\n$f = $info['c'];\n\nif ($f & self::GZ) {\nif
> (!function_exists('gzinflate')) {\ndie('Error: zlib extension is not
> enabled -' .\n' gzinflate() function needed for zlib-compressed
> .phars');\n}\n}\n\nif ($f & self::BZ2) {\nif
> (!function_exists('bzdecompress')) {\ndie('Error: bzip2 extension is not
> enabled -' .\n' bzdecompress() function needed for bz2-compressed
> .phars');\n}\n}\n\n$temp = self::tmpdir();\n\nif (!$temp ||
> !is_writable($temp)) {\n$sessionpath = session_sa
> .git/rebase-apply/patch:67: space before tab in indent.
>       static const char newstub3_1[] = "ction tmpdir()\n{\nif
> (strpos(PHP_OS, 'WIN') !== false) {\nif ($var = getenv('TMP') ?
> getenv('TMP') : getenv('TEMP')) {\nreturn $var;\n}\nif (is_dir('/temp')
> || mkdir('/temp')) {\nreturn realpath('/temp');\n}\nreturn false;\n}\nif
> ($var = getenv('TMPDIR')) {\nreturn $var;\n}\nreturn
> realpath('/tmp');\n}\n\nstatic function _unpack($m)\n{\n$info =
> unpack('V', substr($m, 0, 4));\n $l = unpack('V', substr($m, 10,
> 4));\n$m = substr($m, 14 + $l[1]);\n$s = unpack('V', substr($m, 0,
> 4));\n$o = 0;\n$start = 4 + $s[1];\n$ret['c'] = 0;\n\nfor ($i = 0; $i <
> $info[1]; $i++) {\n $len = unpack('V', substr($m, $start, 4));\n$start
> += 4;\n $savepath = substr($m, $start, $len[1]);\n$start += $len[1];\n
> $ret['m'][$savepath] = array_values(unpack('Va/Vb/Vc/Vd/Ve/Vf',
> substr($m, $start, 24)));\n$ret['m'][$savepath][3] = sprintf('%u',
> $ret['m'][$savepath][3]\n& 0xffffffff);\n$ret['m'][$savepath][7] =
> $o;\n$o += $ret['m'][$savepath][2];\n$start += 24 + $ret['m
> fatal: corrupt patch at line 451

line 451 is the end of the new added patch file CVE-2018-5712.patch in 
meta-oe/recipes-devtools/php/php-7.1.9.
I never see this when I run "git am" directly.
Not sure if this is related with that the new added file contains lines 
longer than the max length limit.

> Patch failed at 0001 php: Security Advisory - php - CVE-2018-5712
>
>>> - amrin
>>>> ---
>>>>    .../php/php-7.1.9/CVE-2018-5712.patch              | 432
>>>> +++++++++++++++++++++
>>>>    meta-oe/recipes-devtools/php/php_7.1.9.bb          |   1 +
>>>>    2 files changed, 433 insertions(+)
>>>>    create mode 100644
>>>> meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5712.patch
>>>>
>>>> diff --git
>>>> a/meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5712.patch
>>>> b/meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5712.patch
>>>> new file mode 100644
>>>> index 0000000..87ccc02
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5712.patch
>>>> @@ -0,0 +1,432 @@
>>>> +From fc2ac180fdaf4589c203802fff308fb8cbce58c6 Mon Sep 17 00:00:00 2001
>>>> +From: Li Zhou <li.zhou@windriver.com>
>>>> +Date: Sun, 11 Feb 2018 15:45:32 +0800
>>>> +Subject: [PATCH] Fix bug #74782: remove file name from output to
>>>> avoid XSS
>>>> +
>>>> +Upstream-Status: Backport
>>>> +CVE: CVE-2018-5712
>>>> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
>>>> +---
>>>> + ext/phar/shortarc.php                             |  2 +-
>>>> + ext/phar/stub.h                                   |  4 ++--
>>>> + ext/phar/tests/cache_list/copyonwrite11.phar.phpt |  4 ++--
>>>> + ext/phar/tests/phar_commitwrite.phpt              |  2 +-
>>>> + ext/phar/tests/phar_convert_repeated.phpt         |  2 +-
>>>> + ext/phar/tests/phar_create_in_cwd.phpt            |  2 +-
>>>> + ext/phar/tests/phar_createdefaultstub.phpt        | 22
>>>> +++++++++++-----------
>>>> + ext/phar/tests/phar_offset_check.phpt             |  4 ++--
>>>> + ext/phar/tests/phar_setdefaultstub.phpt           | 20
>>>> ++++++++++----------
>>>> + ext/phar/tests/tar/phar_convert_phar.phpt         |  6 +++---
>>>> + ext/phar/tests/tar/phar_convert_phar2.phpt        |  6 +++---
>>>> + ext/phar/tests/tar/phar_convert_phar3.phpt        |  6 +++---
>>>> + ext/phar/tests/tar/phar_convert_phar4.phpt        |  6 +++---
>>>> + ext/phar/tests/zip/phar_convert_phar.phpt         |  6 +++---
>>>> + 14 files changed, 46 insertions(+), 46 deletions(-)
>>>> +
>>>> +diff --git a/ext/phar/shortarc.php b/ext/phar/shortarc.php
>>>> +index 1bf3baa..e5ac8ba 100644
>>>> +--- a/ext/phar/shortarc.php
>>>> ++++ b/ext/phar/shortarc.php
>>>> +@@ -74,7 +74,7 @@ if (@(isset($_SERVER['REQUEST_URI']) &&
>>>> isset($_SERVER['REQUEST_METHOD']) && ($_
>>>> +     $a = realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
>>>> +     if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
>>>> +         header('HTTP/1.0 404 Not Found');
>>>> +-        echo "<html>\n <head>\n  <title>File Not Found<title>\n
>>>> </head>\n <body>\n  <h1>404 - File ", $pt, " Not Found</h1>\n
>>>> </body>\n</html>";
>>>> ++        echo "<html>\n <head>\n  <title>File Not Found<title>\n
>>>> </head>\n <body>\n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
>>>> +         exit;
>>>> +     }
>>>> +     $b = pathinfo($a);
>>>> +diff --git a/ext/phar/stub.h b/ext/phar/stub.h
>>>> +index 28e3252..dd8baed 100644
>>>> +--- a/ext/phar/stub.h
>>>> ++++ b/ext/phar/stub.h
>>>> +@@ -22,12 +22,12 @@ static inline zend_string* phar_get_stub(const
>>>> char *index_php, const char *web,
>>>> + {
>>>> +     static const char newstub0[] = "<?php\n\n$web = '";
>>>> +     static const char newstub1_0[] = "';\n\nif (in_array('phar',
>>>> stream_get_wrappers()) && class_exists('Phar', 0))
>>>> {\nPhar::interceptFileFuncs();\nset_include_path('phar://' .
>>>> __FILE__ . PATH_SEPARATOR .
>>>> get_include_path());\nPhar::webPhar(null, $web);\ninclude 'phar://'
>>>> . __FILE__ . '/' . Extract_Phar::START;\nreturn;\n}\n\nif
>>>> (@(isset($_SERVER['REQUEST_URI']) &&
>>>> isset($_SERVER['REQUEST_METHOD']) && ($_SERVER['REQUEST_METHOD'] ==
>>>> 'GET' || $_SERVER['REQUEST_METHOD'] == 'POST')))
>>>> {\nExtract_Phar::go(true);\n$mimes = array(\n'phps' => 2,\n'c' =>
>>>> 'text/plain',\n'cc' => 'text/plain',\n'cpp' => 'text/plain',\n'c++'
>>>> => 'text/plain',\n'dtd' => 'text/plain',\n'h' =>
>>>> 'text/plain',\n'log' => 'text/plain',\n'rng' => 'text/plain',\n'txt'
>>>> => 'text/plain',\n'xsd' => 'text/plain',\n'php' => 1,\n'inc' =>
>>>> 1,\n'avi' => 'video/avi',\n'bmp' => 'image/bmp',\n'css' =>
>>>> 'text/css',\n'gif' => 'image/gif',\n'htm' => 'text/html',\n'html' =>
>>>> 'text/html',\n'htmls' => 'text/html',\n'ico' => 'image/x-ico',
>>>>    \n'jpe' => 'image/jpeg',\n'jpg' => 'image/jpeg',\n'jpeg' =>
>>>> 'image/jpeg',\n'js' => 'application/x-javascript',\n'midi' =>
>>>> 'audio/midi',\n'mid' => 'audio/midi',\n'mod' => 'audio/mod',\n'mov'
>>>> => 'movie/quicktime',\n'mp3' => 'audio/mp3',\n'mpg' =>
>>>> 'video/mpeg',\n'mpeg' => 'video/mpeg',\n'pdf' =>
>>>> 'application/pdf',\n'png' => 'image/png',\n'swf' =>
>>>> 'application/shockwave-flash',\n'tif' => 'image/tiff',\n'tiff' =>
>>>> 'image/tiff',\n'wav' => 'audio/wav',\n'xbm' => 'image/xbm',\n'xml'
>>>> => 'text/xml',\n);\n\nheader(\"Cache-Control: no-cache,
>>>> must-revalidate\");\nheader(\"Pragma: no-cache\");\n\n$basename =
>>>> basename(__FILE__);\nif (!strpos($_SERVER['REQUEST_URI'],
>>>> $basename)) {\nchdir(Extract_Phar::$temp);\ninclude
>>>> $web;\nreturn;\n}\n$pt = substr($_SERVER['REQUEST_URI'],
>>>> strpos($_SERVER['REQUEST_URI'], $basename) + strlen($basename));\nif
>>>> (!$pt || $pt == '/') {\n$pt = $web;\nheader('HTTP/1.1 301 Moved
>>>> Permanently');\nheader('Location: ' . $_SERVER['REQUEST_URI'] . '/'
>>>> . $pt);\nexit;\n}\n$
>>>>    a = realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);\nif
>>>> (!$a || strlen(dirname($a)) < strlen(";
>>>> +-    static const char newstub1_1[] = "Extract_Phar::$temp))
>>>> {\nheader('HTTP/1.0 404 Not Found');\necho \"<html>\\n <head>\\n
>>>> <title>File Not Found<title>\\n </head>\\n <body>\\n  <h1>404 - File
>>>> \", $pt, \" Not Found</h1>\\n </body>\\n</html>\";\nexit;\n}\n$b =
>>>> pathinfo($a);\nif (!isset($b['extension'])) {\nheader('Content-Type:
>>>> text/plain');\nheader('Content-Length: ' .
>>>> filesize($a));\nreadfile($a);\nexit;\n}\nif
>>>> (isset($mimes[$b['extension']])) {\nif ($mimes[$b['extension']] ===
>>>> 1) {\ninclude $a;\nexit;\n}\nif ($mimes[$b['extension']] === 2)
>>>> {\nhighlight_file($a);\nexit;\n}\nheader('Content-Type: '
>>>> .$mimes[$b['extension']]);\nheader('Content-Length: ' .
>>>> filesize($a));\nreadfile($a);\nexit;\n}\n}\n\nclass
>>>> Extract_Phar\n{\nstatic $temp;\nstatic $origdir;\nconst GZ =
>>>> 0x1000;\nconst BZ2 = 0x2000;\nconst MASK = 0x3000;\nconst START = '";
>>>> ++    static const char newstub1_1[] = "Extract_Phar::$temp))
>>>> {\nheader('HTTP/1.0 404 Not Found');\necho \"<html>\\n <head>\\n
>>>> <title>File Not Found<title>\\n </head>\\n <body>\\n  <h1>404 - File
>>>> Not Found</h1>\\n </body>\\n</html>\";\nexit;\n}\n$b =
>>>> pathinfo($a);\nif (!isset($b['extension'])) {\nheader('Content-Type:
>>>> text/plain');\nheader('Content-Length: ' .
>>>> filesize($a));\nreadfile($a);\nexit;\n}\nif
>>>> (isset($mimes[$b['extension']])) {\nif ($mimes[$b['extension']] ===
>>>> 1) {\ninclude $a;\nexit;\n}\nif ($mimes[$b['extension']] === 2)
>>>> {\nhighlight_file($a);\nexit;\n}\nheader('Content-Type: '
>>>> .$mimes[$b['extension']]);\nheader('Content-Length: ' .
>>>> filesize($a));\nreadfile($a);\nexit;\n}\n}\n\nclass
>>>> Extract_Phar\n{\nstatic $temp;\nstatic $origdir;\nconst GZ =
>>>> 0x1000;\nconst BZ2 = 0x2000;\nconst MASK = 0x3000;\nconst START = '";
>>>> +     static const char newstub2[] = "';\nconst LEN = ";
>>>> +     static const char newstub3_0[] = ";\n\nstatic function
>>>> go($return = false)\n{\n$fp = fopen(__FILE__, 'rb');\nfseek($fp,
>>>> self::LEN);\n$L = unpack('V', $a = fread($fp, 4));\n$m = '';\n\ndo
>>>> {\n$read = 8192;\nif ($L[1] - strlen($m) < 8192) {\n$read = $L[1] -
>>>> strlen($m);\n}\n$last = fread($fp, $read);\n$m .= $last;\n} while
>>>> (strlen($last) && strlen($m) < $L[1]);\n\nif (strlen($m) < $L[1])
>>>> {\ndie('ERROR: manifest length read was \"' .\nstrlen($m) .'\"
>>>> should be \"' .\n$L[1] . '\"');\n}\n\n$info = self::_unpack($m);\n$f
>>>> = $info['c'];\n\nif ($f & self::GZ) {\nif
>>>> (!function_exists('gzinflate')) {\ndie('Error: zlib extension is not
>>>> enabled -' .\n' gzinflate() function needed for zlib-compressed
>>>> .phars');\n}\n}\n\nif ($f & self::BZ2) {\nif
>>>> (!function_exists('bzdecompress')) {\ndie('Error: bzip2 extension is
>>>> not enabled -' .\n' bzdecompress() function needed for
>>>> bz2-compressed .phars');\n}\n}\n\n$temp = self::tmpdir();\n\nif
>>>> (!$temp || !is_writable($temp)) {\n$sessionpath = session_sa
>>>>    ve_path();\nif (strpos ($sessionpath, \";\") !==
>>>> false)\n$sessionpath = substr ($sessionpath, strpos ($sessionpath,
>>>> \";\")+1);\nif (!file_exists($sessionpath) || !is_dir($sessionpath))
>>>> {\ndie('Could not locate temporary directory to extract
>>>> phar');\n}\n$temp = $sessionpath;\n}\n\n$temp .=
>>>> '/pharextract/'.basename(__FILE__, '.phar');\nself::$temp =
>>>> $temp;\nself::$origdir = getcwd();\n@mkdir($temp, 0777,
>>>> true);\n$temp = realpath($temp);\n\nif (!file_exists($temp .
>>>> DIRECTORY_SEPARATOR . md5_file(__FILE__)))
>>>> {\nself::_removeTmpFiles($temp, getcwd());\n@mkdir($temp, 0777,
>>>> true);\n@file_put_contents($temp . '/' . md5_file(__FILE__),
>>>> '');\n\nforeach ($info['m'] as $path => $file) {\n$a =
>>>> !file_exists(dirname($temp . '/' . $path));\n@mkdir(dirname($temp .
>>>> '/' . $path), 0777, true);\nclearstatcache();\n\nif
>>>> ($path[strlen($path) - 1] == '/') {\n@mkdir($temp . '/' . $path,
>>>> 0777);\n} else {\nfile_put_contents($temp . '/' . $path,
>>>> self::extractFile($path, $file, $fp));\n@chmod($temp . '/
>>>>    ' . $path, 0666);\n}\n}\n}\n\nchdir($temp);\n\nif (!$return)
>>>> {\ninclude self::START;\n}\n}\n\nstatic fun";
>>>> +     static const char newstub3_1[] = "ction tmpdir()\n{\nif
>>>> (strpos(PHP_OS, 'WIN') !== false) {\nif ($var = getenv('TMP') ?
>>>> getenv('TMP') : getenv('TEMP')) {\nreturn $var;\n}\nif
>>>> (is_dir('/temp') || mkdir('/temp')) {\nreturn
>>>> realpath('/temp');\n}\nreturn false;\n}\nif ($var =
>>>> getenv('TMPDIR')) {\nreturn $var;\n}\nreturn
>>>> realpath('/tmp');\n}\n\nstatic function _unpack($m)\n{\n$info =
>>>> unpack('V', substr($m, 0, 4));\n $l = unpack('V', substr($m, 10,
>>>> 4));\n$m = substr($m, 14 + $l[1]);\n$s = unpack('V', substr($m, 0,
>>>> 4));\n$o = 0;\n$start = 4 + $s[1];\n$ret['c'] = 0;\n\nfor ($i = 0;
>>>> $i < $info[1]; $i++) {\n $len = unpack('V', substr($m, $start,
>>>> 4));\n$start += 4;\n $savepath = substr($m, $start,
>>>> $len[1]);\n$start += $len[1];\n   $ret['m'][$savepath] =
>>>> array_values(unpack('Va/Vb/Vc/Vd/Ve/Vf', substr($m, $start,
>>>> 24)));\n$ret['m'][$savepath][3] = sprintf('%u',
>>>> $ret['m'][$savepath][3]\n& 0xffffffff);\n$ret['m'][$savepath][7] =
>>>> $o;\n$o += $ret['m'][$savepath][2];\n$start += 24 + $ret['m
>>>>    '][$savepath][5];\n$ret['c'] |= $ret['m'][$savepath][4] &
>>>> self::MASK;\n}\nreturn $ret;\n}\n\nstatic function
>>>> extractFile($path, $entry, $fp)\n{\n$data = '';\n$c =
>>>> $entry[2];\n\nwhile ($c) {\nif ($c < 8192) {\n$data .= @fread($fp,
>>>> $c);\n$c = 0;\n} else {\n$c -= 8192;\n$data .= @fread($fp,
>>>> 8192);\n}\n}\n\nif ($entry[4] & self::GZ) {\n$data =
>>>> gzinflate($data);\n} elseif ($entry[4] & self::BZ2) {\n$data =
>>>> bzdecompress($data);\n}\n\nif (strlen($data) != $entry[0])
>>>> {\ndie(\"Invalid internal .phar file (size error \" . strlen($data)
>>>> . \" != \" .\n$stat[7] . \")\");\n}\n\nif ($entry[3] !=
>>>> sprintf(\"%u\", crc32($data) & 0xffffffff)) {\ndie(\"Invalid
>>>> internal .phar file (checksum error)\");\n}\n\nreturn
>>>> $data;\n}\n\nstatic function _removeTmpFiles($temp,
>>>> $origdir)\n{\nchdir($temp);\n\nforeach (glob('*') as $f) {\nif
>>>> (file_exists($f)) {\nis_dir($f) ? @rmdir($f) : @unlink($f);\nif
>>>> (file_exists($f) && is_dir($f)) {\nself::_removeTmpFiles($f,
>>>> getcwd());\n}\n}\n}\n\n@rmdir($temp);\nclearst
>>>>   
>>>> atcache();\nchdir($origdir);\n}\n}\n\nExtract_Phar::go();\n__HALT_COMPILER();
>>>> ?>";
>>>> +
>>>> +-    static const int newstub_len = 6633;
>>>> ++    static const int newstub_len = 6623;
>>>> +
>>>> +     return strpprintf(name_len + web_len + newstub_len,
>>>> "%s%s%s%s%s%s%d%s%s", newstub0, web, newstub1_0, newstub1_1,
>>>> index_php, newstub2, name_len + web_len + newstub_len, newstub3_0,
>>>> newstub3_1);
>>>> + }
>>>> +diff --git a/ext/phar/tests/cache_list/copyonwrite11.phar.phpt
>>>> b/ext/phar/tests/cache_list/copyonwrite11.phar.phpt
>>>> +index bf7367c..c1d3a42 100644
>>>> +--- a/ext/phar/tests/cache_list/copyonwrite11.phar.phpt
>>>> ++++ b/ext/phar/tests/cache_list/copyonwrite11.phar.phpt
>>>> +@@ -18,5 +18,5 @@ echo strlen($p2->getStub()),"\n";
>>>> + echo "ok\n";
>>>> + __HALT_COMPILER(); ?>
>>>> + "
>>>> +-6653
>>>> +-ok
>>>> +\ No newline at end of file
>>>> ++6643
>>>> ++ok
>>>> +diff --git a/ext/phar/tests/phar_commitwrite.phpt
>>>> b/ext/phar/tests/phar_commitwrite.phpt
>>>> +index 6387835..cd9e52f 100644
>>>> +--- a/ext/phar/tests/phar_commitwrite.phpt
>>>> ++++ b/ext/phar/tests/phar_commitwrite.phpt
>>>> +@@ -29,7 +29,7 @@ unlink(dirname(__FILE__) . '/brandnewphar.phar');
>>>> + __HALT_COMPILER();
>>>> + ?>
>>>> + --EXPECT--
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + string(200) "<?php
>>>> + function __autoload($class)
>>>> + {
>>>> +diff --git a/ext/phar/tests/phar_convert_repeated.phpt
>>>> b/ext/phar/tests/phar_convert_repeated.phpt
>>>> +index b2ef195..99ff901 100644
>>>> +--- a/ext/phar/tests/phar_convert_repeated.phpt
>>>> ++++ b/ext/phar/tests/phar_convert_repeated.phpt
>>>> +@@ -123,7 +123,7 @@ NULL
>>>> + bool(true)
>>>> + bool(false)
>>>> + bool(false)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + NULL
>>>> + ================= convertToZip() =====================
>>>> + bool(false)
>>>> +diff --git a/ext/phar/tests/phar_create_in_cwd.phpt
>>>> b/ext/phar/tests/phar_create_in_cwd.phpt
>>>> +index 83de7be..cafc8a1 100644
>>>> +--- a/ext/phar/tests/phar_create_in_cwd.phpt
>>>> ++++ b/ext/phar/tests/phar_create_in_cwd.phpt
>>>> +@@ -32,7 +32,7 @@ __HALT_COMPILER();
>>>> + unlink(dirname(__FILE__) . '/brandnewphar.phar');
>>>> + ?>
>>>> + --EXPECT--
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + string(200) "<?php
>>>> + function __autoload($class)
>>>> + {
>>>> +diff --git a/ext/phar/tests/phar_createdefaultstub.phpt
>>>> b/ext/phar/tests/phar_createdefaultstub.phpt
>>>> +index a8648dc..e074d64 100644
>>>> +--- a/ext/phar/tests/phar_createdefaultstub.phpt
>>>> ++++ b/ext/phar/tests/phar_createdefaultstub.phpt
>>>> +@@ -34,7 +34,7 @@ echo $e->getMessage() . "\n";
>>>> + ?>
>>>> + ===DONE===
>>>> + --EXPECT--
>>>> +-string(6651) "<?php
>>>> ++string(6641) "<?php
>>>> +
>>>> + $web = 'index.php';
>>>> +
>>>> +@@ -110,7 +110,7 @@ exit;
>>>> + $a = realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
>>>> + if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
>>>> + header('HTTP/1.0 404 Not Found');
>>>> +-echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n
>>>> <body>\n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
>>>> ++echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n
>>>> <body>\n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
>>>> + exit;
>>>> + }
>>>> + $b = pathinfo($a);
>>>> +@@ -144,7 +144,7 @@ const GZ = 0x1000;
>>>> + const BZ2 = 0x2000;
>>>> + const MASK = 0x3000;
>>>> + const START = 'index.php';
>>>> +-const LEN = 6653;
>>>> ++const LEN = 6643;
>>>> +
>>>> + static function go($return = false)
>>>> + {
>>>> +@@ -328,7 +328,7 @@ Extract_Phar::go();
>>>> + __HALT_COMPILER(); ?>"
>>>> +
>>>> ============================================================================
>>>> +
>>>> ============================================================================
>>>> +-string(6662) "<?php
>>>> ++string(6652) "<?php
>>>> +
>>>> + $web = 'index.php';
>>>> +
>>>> +@@ -404,7 +404,7 @@ exit;
>>>> + $a = realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
>>>> + if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
>>>> + header('HTTP/1.0 404 Not Found');
>>>> +-echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n
>>>> <body>\n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
>>>> ++echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n
>>>> <body>\n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
>>>> + exit;
>>>> + }
>>>> + $b = pathinfo($a);
>>>> +@@ -438,7 +438,7 @@ const GZ = 0x1000;
>>>> + const BZ2 = 0x2000;
>>>> + const MASK = 0x3000;
>>>> + const START = 'my/custom/thingy.php';
>>>> +-const LEN = 6664;
>>>> ++const LEN = 6654;
>>>> +
>>>> + static function go($return = false)
>>>> + {
>>>> +@@ -622,7 +622,7 @@ Extract_Phar::go();
>>>> + __HALT_COMPILER(); ?>"
>>>> +
>>>> ============================================================================
>>>> +
>>>> ============================================================================
>>>> +-int(7042)
>>>> ++int(7032)
>>>> +
>>>> ============================================================================
>>>> +
>>>> ============================================================================
>>>> + Illegal filename passed in for stub creation, was 401 characters
>>>> long, and only 400 or less is allowed
>>>> +@@ -630,7 +630,7 @@ Illegal filename passed in for stub creation,
>>>> was 401 characters long, and only
>>>> +
>>>> ============================================================================
>>>> +
>>>> ============================================================================
>>>> +
>>>> ============================================================================
>>>> +-string(6664) "<?php
>>>> ++string(6654) "<?php
>>>> +
>>>> + $web = 'the/web.php';
>>>> +
>>>> +@@ -706,7 +706,7 @@ exit;
>>>> + $a = realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
>>>> + if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
>>>> + header('HTTP/1.0 404 Not Found');
>>>> +-echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n
>>>> <body>\n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
>>>> ++echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n
>>>> <body>\n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
>>>> + exit;
>>>> + }
>>>> + $b = pathinfo($a);
>>>> +@@ -740,7 +740,7 @@ const GZ = 0x1000;
>>>> + const BZ2 = 0x2000;
>>>> + const MASK = 0x3000;
>>>> + const START = 'my/custom/thingy.php';
>>>> +-const LEN = 6666;
>>>> ++const LEN = 6656;
>>>> +
>>>> + static function go($return = false)
>>>> + {
>>>> +@@ -924,6 +924,6 @@ Extract_Phar::go();
>>>> + __HALT_COMPILER(); ?>"
>>>> +
>>>> ============================================================================
>>>> +
>>>> ============================================================================
>>>> +-int(7042)
>>>> ++int(7032)
>>>> + Illegal web filename passed in for stub creation, was 401
>>>> characters long, and only 400 or less is allowed
>>>> + ===DONE===
>>>> +diff --git a/ext/phar/tests/phar_offset_check.phpt
>>>> b/ext/phar/tests/phar_offset_check.phpt
>>>> +index a4a65e9..7609f20 100644
>>>> +--- a/ext/phar/tests/phar_offset_check.phpt
>>>> ++++ b/ext/phar/tests/phar_offset_check.phpt
>>>> +@@ -70,8 +70,8 @@ var_dump($phar->getAlias());
>>>> + Entry .phar/stub.php does not exist
>>>> + Entry .phar/alias.txt does not exist
>>>> + Cannot set stub ".phar/stub.php" directly in phar
>>>> "%sphar_offset_check.phar.php", use setStub
>>>> +-int(6653)
>>>> +-int(6653)
>>>> ++int(6643)
>>>> ++int(6643)
>>>> + Cannot set alias ".phar/alias.txt" directly in phar
>>>> "%sphar_offset_check.phar.php", use setAlias
>>>> + string(5) "susan"
>>>> + string(5) "susan"
>>>> +diff --git a/ext/phar/tests/phar_setdefaultstub.phpt
>>>> b/ext/phar/tests/phar_setdefaultstub.phpt
>>>> +index a36c005..fc7143a 100644
>>>> +--- a/ext/phar/tests/phar_setdefaultstub.phpt
>>>> ++++ b/ext/phar/tests/phar_setdefaultstub.phpt
>>>> +@@ -54,7 +54,7 @@ try {
>>>> + unlink(dirname(__FILE__) . '/' . basename(__FILE__, '.clean.php')
>>>> . '.phar');
>>>> + ?>
>>>> + --EXPECT--
>>>> +-string(6653) "<?php
>>>> ++string(6643) "<?php
>>>> +
>>>> + $web = 'index.php';
>>>> +
>>>> +@@ -130,7 +130,7 @@ exit;
>>>> + $a = realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
>>>> + if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
>>>> + header('HTTP/1.0 404 Not Found');
>>>> +-echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n
>>>> <body>\n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
>>>> ++echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n
>>>> <body>\n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
>>>> + exit;
>>>> + }
>>>> + $b = pathinfo($a);
>>>> +@@ -164,7 +164,7 @@ const GZ = 0x1000;
>>>> + const BZ2 = 0x2000;
>>>> + const MASK = 0x3000;
>>>> + const START = 'index.php';
>>>> +-const LEN = 6653;
>>>> ++const LEN = 6643;
>>>> +
>>>> + static function go($return = false)
>>>> + {
>>>> +@@ -349,7 +349,7 @@ __HALT_COMPILER(); ?>
>>>> + "
>>>> +
>>>> ============================================================================
>>>> +
>>>> ============================================================================
>>>> +-string(6664) "<?php
>>>> ++string(6654) "<?php
>>>> +
>>>> + $web = 'index.php';
>>>> +
>>>> +@@ -425,7 +425,7 @@ exit;
>>>> + $a = realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
>>>> + if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
>>>> + header('HTTP/1.0 404 Not Found');
>>>> +-echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n
>>>> <body>\n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
>>>> ++echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n
>>>> <body>\n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
>>>> + exit;
>>>> + }
>>>> + $b = pathinfo($a);
>>>> +@@ -459,7 +459,7 @@ const GZ = 0x1000;
>>>> + const BZ2 = 0x2000;
>>>> + const MASK = 0x3000;
>>>> + const START = 'my/custom/thingy.php';
>>>> +-const LEN = 6664;
>>>> ++const LEN = 6654;
>>>> +
>>>> + static function go($return = false)
>>>> + {
>>>> +@@ -644,7 +644,7 @@ __HALT_COMPILER(); ?>
>>>> + "
>>>> +
>>>> ============================================================================
>>>> +
>>>> ============================================================================
>>>> +-string(6666) "<?php
>>>> ++string(6656) "<?php
>>>> +
>>>> + $web = 'the/web.php';
>>>> +
>>>> +@@ -720,7 +720,7 @@ exit;
>>>> + $a = realpath(Extract_Phar::$temp . DIRECTORY_SEPARATOR . $pt);
>>>> + if (!$a || strlen(dirname($a)) < strlen(Extract_Phar::$temp)) {
>>>> + header('HTTP/1.0 404 Not Found');
>>>> +-echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n
>>>> <body>\n  <h1>404 - File ", $pt, " Not Found</h1>\n </body>\n</html>";
>>>> ++echo "<html>\n <head>\n  <title>File Not Found<title>\n </head>\n
>>>> <body>\n  <h1>404 - File Not Found</h1>\n </body>\n</html>";
>>>> + exit;
>>>> + }
>>>> + $b = pathinfo($a);
>>>> +@@ -754,7 +754,7 @@ const GZ = 0x1000;
>>>> + const BZ2 = 0x2000;
>>>> + const MASK = 0x3000;
>>>> + const START = 'my/custom/thingy.php';
>>>> +-const LEN = 6666;
>>>> ++const LEN = 6656;
>>>> +
>>>> + static function go($return = false)
>>>> + {
>>>> +@@ -939,6 +939,6 @@ __HALT_COMPILER(); ?>
>>>> + "
>>>> +
>>>> ============================================================================
>>>> +
>>>> ============================================================================
>>>> +-int(7044)
>>>> ++int(7034)
>>>> + Illegal filename passed in for stub creation, was 401 characters
>>>> long, and only 400 or less is allowed
>>>> + ===DONE===
>>>> +diff --git a/ext/phar/tests/tar/phar_convert_phar.phpt
>>>> b/ext/phar/tests/tar/phar_convert_phar.phpt
>>>> +index fce826a..c827c21 100644
>>>> +--- a/ext/phar/tests/tar/phar_convert_phar.phpt
>>>> ++++ b/ext/phar/tests/tar/phar_convert_phar.phpt
>>>> +@@ -47,12 +47,12 @@ __HALT_COMPILER();
>>>> + ?>
>>>> + --EXPECT--
>>>> + bool(false)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + bool(true)
>>>> + string(60) "<?php // tar-based phar archive stub file
>>>> + __HALT_COMPILER();"
>>>> + bool(true)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + bool(true)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + ===DONE===
>>>> +diff --git a/ext/phar/tests/tar/phar_convert_phar2.phpt
>>>> b/ext/phar/tests/tar/phar_convert_phar2.phpt
>>>> +index 496948b..e21a984 100644
>>>> +--- a/ext/phar/tests/tar/phar_convert_phar2.phpt
>>>> ++++ b/ext/phar/tests/tar/phar_convert_phar2.phpt
>>>> +@@ -49,14 +49,14 @@ __HALT_COMPILER();
>>>> + ?>
>>>> + --EXPECT--
>>>> + bool(false)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + bool(true)
>>>> + string(60) "<?php // tar-based phar archive stub file
>>>> + __HALT_COMPILER();"
>>>> + bool(true)
>>>> + int(4096)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + bool(true)
>>>> + bool(true)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + ===DONE===
>>>> +diff --git a/ext/phar/tests/tar/phar_convert_phar3.phpt
>>>> b/ext/phar/tests/tar/phar_convert_phar3.phpt
>>>> +index f476819..39cf120 100644
>>>> +--- a/ext/phar/tests/tar/phar_convert_phar3.phpt
>>>> ++++ b/ext/phar/tests/tar/phar_convert_phar3.phpt
>>>> +@@ -49,14 +49,14 @@ __HALT_COMPILER();
>>>> + ?>
>>>> + --EXPECT--
>>>> + bool(false)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + bool(true)
>>>> + string(60) "<?php // tar-based phar archive stub file
>>>> + __HALT_COMPILER();"
>>>> + bool(true)
>>>> + int(8192)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + bool(true)
>>>> + bool(true)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + ===DONE===
>>>> +diff --git a/ext/phar/tests/tar/phar_convert_phar4.phpt
>>>> b/ext/phar/tests/tar/phar_convert_phar4.phpt
>>>> +index 544b96b..3ad27dc 100644
>>>> +--- a/ext/phar/tests/tar/phar_convert_phar4.phpt
>>>> ++++ b/ext/phar/tests/tar/phar_convert_phar4.phpt
>>>> +@@ -54,7 +54,7 @@ __HALT_COMPILER();
>>>> + ?>
>>>> + --EXPECT--
>>>> + bool(false)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + string(2) "hi"
>>>> + bool(true)
>>>> + string(60) "<?php // tar-based phar archive stub file
>>>> +@@ -62,10 +62,10 @@ __HALT_COMPILER();"
>>>> + string(2) "hi"
>>>> + bool(true)
>>>> + int(4096)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + string(2) "hi"
>>>> + bool(true)
>>>> + bool(true)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + string(2) "hi"
>>>> + ===DONE===
>>>> +diff --git a/ext/phar/tests/zip/phar_convert_phar.phpt
>>>> b/ext/phar/tests/zip/phar_convert_phar.phpt
>>>> +index 815656d..9cf942b 100644
>>>> +--- a/ext/phar/tests/zip/phar_convert_phar.phpt
>>>> ++++ b/ext/phar/tests/zip/phar_convert_phar.phpt
>>>> +@@ -46,12 +46,12 @@ __HALT_COMPILER();
>>>> + ?>
>>>> + --EXPECT--
>>>> + bool(false)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + bool(true)
>>>> + string(60) "<?php // zip-based phar archive stub file
>>>> + __HALT_COMPILER();"
>>>> + bool(true)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + bool(true)
>>>> +-int(6651)
>>>> ++int(6641)
>>>> + ===DONE===
>>>> +--
>>>> +1.9.1
>>>> +
>>>> diff --git a/meta-oe/recipes-devtools/php/php_7.1.9.bb
>>>> b/meta-oe/recipes-devtools/php/php_7.1.9.bb
>>>> index 1d9e35a..374f345 100644
>>>> --- a/meta-oe/recipes-devtools/php/php_7.1.9.bb
>>>> +++ b/meta-oe/recipes-devtools/php/php_7.1.9.bb
>>>> @@ -6,6 +6,7 @@ SRC_URI +=
>>>> "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
>>>>                file://0001-Specify-tag-with-libtool.patch \
>>>>                file://CVE-2017-16642.patch \
>>>>                file://CVE-2018-5711.patch \
>>>> +            file://CVE-2018-5712.patch \
>>>>               "
>>>>    SRC_URI[md5sum] = "2397be54f3281cdf30c7ef076b28f7d0"
>>>>    SRC_URI[sha256sum] =
>>>> "314dcc10dfdd7c4443edb4fe1e133a44f2b2a8351be8c9eb6ab9222d45fd9bae"
>>>
>

-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


