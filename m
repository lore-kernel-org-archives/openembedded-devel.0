Subject: glibc fetcher failure issue in poky dunfell
To: openembedded-devel@lists.openembedded.org
From: "Jyothi-k" <jyothik41rao@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.207.203.246)
X-Originating-Platform: Windows Chrome 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 18 Jan 2021 22:41:48 -0800
Message-ID: <ADdO.1611038508226492907.K9Qv@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="k4AkANIUd9PJYtJTX9bu"

--k4AkANIUd9PJYtJTX9bu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

I am using poky (dunfell) for my development and recently during my automa=
ted builds am getting the below error in recipe poky/meta/recipes-core/glib=
c/glibc_2.31.bb. Kindly provide your inputs to resolve the issue.

ERROR: glibc-2.31+gitAUTOINC+df31c7ca92-r0 do_fetch: Network access disabl=
ed through BB_NO_NETWORK (or set indirectly due to use of BB_FETCH_PREMIRRO=
RONLY) but access requested with command LANG=3DC git -c core.fsyncobjectfi=
les=3D0 fetch -f --progress "git://sourceware.org/git/glibc.git" refs/*:ref=
s/* (for url git://sourceware.org/git/glibc.git;branch=3Drelease/2.31/maste=
r;name=3Dglibc)

DEBUG: Mirror fetch failure for url http://downloads.yoctoproject.org/mirr=
or/sources/git2_sourceware.org.git.glibc.git.tar.gz (original url: git://so=
urceware.org/git/glibc.git;branch=3Drelease/2.31/master;name=3Dglibc)
DEBUG: Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset _P=
YTHON_SYSCONFIGDATA_NAME;   LANG=3DC git -c core.fsyncobjectfiles=3D0 fetch=
 -f --progress "git://sourceware.org/git/glibc.git" refs/*:refs/* failed wi=
th exit code 128, output:
fatal: unable to connect to sourceware.org:
sourceware.org[0: 8.43.85.97]: errno=3DConnection timed out
sourceware.org[1: 2620:52:3:1:0:246e:9693:128c]: errno=3DCannot assign req=
uested address

Note : Same issue occurs for *cross-localedef-native-2.31 recipe*

Thanks,
Jyothi

--k4AkANIUd9PJYtJTX9bu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello all,<br /><br />I am using poky (dunfell) for my development and rece=
ntly during my automated builds am getting the below error in recipe poky/m=
eta/recipes-core/glibc/glibc_2.31.bb. Kindly provide your inputs to resolve=
 the issue.<br /><br />
<pre class=3D"console-output" style=3D"box-sizing: inherit; margin-bottom:=
 0px; line-height: 1.42857; background-color: #ffffff;"><span class=3D"pipe=
line-node-80" style=3D"box-sizing: inherit;"><span style=3D"white-space: pr=
e-wrap;">ERROR: glibc-2.31+gitAUTOINC+df31c7ca92-r0 do_fetch: Network acces=
s disabled through BB_NO_NETWORK (or set indirectly due to use of BB_FETCH_=
PREMIRRORONLY) but access requested with command LANG=3DC git -c core.fsync=
objectfiles=3D0 fetch -f --progress "git://sourceware.org/git/glibc.git" re=
fs/*:refs/* (for url git://sourceware.org/git/glibc.git;branch=3Drelease/2.=
31/master;name=3Dglibc)<br /><br /><br /></span><span style=3D"font-size: 1=
4px; white-space: pre-wrap;">DEBUG: Mirror fetch failure for url http://dow=
nloads.yoctoproject.org/mirror/sources/git2_sourceware.org.git.glibc.git.ta=
r.gz (original url: git://sourceware.org/git/glibc.git;branch=3Drelease/2.3=
1/master;name=3Dglibc)
DEBUG: Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset _P=
YTHON_SYSCONFIGDATA_NAME;   LANG=3DC git -c core.fsyncobjectfiles=3D0 fetch=
 -f --progress "git://sourceware.org/git/glibc.git" refs/*:refs/* failed wi=
th exit code 128, output:
fatal: unable to connect to sourceware.org:
sourceware.org[0: 8.43.85.97]: errno=3DConnection timed out
sourceware.org[1: 2620:52:3:1:0:246e:9693:128c]: errno=3DCannot assign req=
uested address</span><span style=3D"white-space: pre-wrap;"><br /></span></=
span></pre>
<br />Note : Same issue occurs for&nbsp;<strong><span style=3D"font-family=
: Menlo, Monaco, Consolas, 'Courier New', monospace; font-size: var(--font-=
size-monospace); white-space: pre-wrap;">cross-localedef-native-2.31 recipe=
</span></strong><br /><br />Thanks,<br />Jyothi

--k4AkANIUd9PJYtJTX9bu--
