Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <zoumpis@gmail.com>) id 1RyCPe-00060s-TD
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 02:15:05 +0100
Received: by obhx4 with SMTP id x4so4053797obh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 17:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ZFYjG5zB+lewntHset4LbQRsHzDIn/pIVJWdc4mFe0E=;
	b=V/j/a9sJC6D10RgHFszRK5YU6J2y5Wtsfq4UVN5/ilbWTgU4P/9igWtmdKROitbkc7
	yhPUnQ0dzgp/ei49iZthnq408HYBvTeBBolcsi/YN9/glBbI4qeR1MyWkFp3VIHZali2
	Rf2gP4hZNw/WKHG9fhwALGU4ogWQbTtyARJ3k=
MIME-Version: 1.0
Received: by 10.182.155.68 with SMTP id vu4mr3419482obb.61.1329440808586; Thu,
	16 Feb 2012 17:06:48 -0800 (PST)
Received: by 10.182.8.40 with HTTP; Thu, 16 Feb 2012 17:06:48 -0800 (PST)
Date: Fri, 17 Feb 2012 02:06:48 +0100
Message-ID: <CAEjf2bhPLjjk3nuh4en5qy1Fs0v0BugmZMQB8nd2N5myPQThMg@mail.gmail.com>
From: Athanasios-Ilias Rousinopoulos <zoumpis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Problem while building a simple helloworld.bb recipe....
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Feb 2012 01:15:06 -0000
X-Groupsio-MsgNum: 37202
Content-Type: multipart/mixed; boundary=f46d04478497254d1204b91e8ffe

--f46d04478497254d1204b91e8ffe
Content-Type: text/plain; charset=ISO-8859-1

Hello everybody,

I face a problem while i build my helloworld recipe. Here i present
all the information , also i submit the bitbake recipe and the .c
source. Thanks. Hope someone can help me to overcome this problem and
configure correctly the recipe. Thanks

Notice : I create a folder called "files" where the .c file is stored.
Furthermore i did follow the documentation provided by the team
(http://docs.openembedded.org/usermanual/usermanual.html#recipes_helloworld_example)




Error appeared in the terminal while building the .bb recipe : "

zoumpis@linux-bc34:~> bitbake -b
/home/zoumpis/work/oe/openembedded/recipes/myhelloworld/myhelloworld_0.1.bb

Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "master"
METADATA_REVISION = "f5626cb"
TARGET_ARCH       = "i586"
TARGET_OS         = "linux"
MACHINE           = "epia"
DISTRO            = "generic"
DISTRO_VERSION    = ""

ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/zoumpis/work/oe/openembedded/recipes/myhelloworld/myhelloworld_0.1.bb
do_compile failed
NOTE: Preparing runqueue
NOTE: Executing runqueue
ERROR: Task 11 (/home/zoumpis/work/oe/openembedded/recipes/myhelloworld/myhelloworld_0.1.bb,
do_compile) failed with 256
ERROR: '/home/zoumpis/work/oe/openembedded/recipes/myhelloworld/myhelloworld_0.1.bb'
failed
NOTE: Running task 6 of 14 (ID: 11,
/home/zoumpis/work/oe/openembedded/recipes/myhelloworld/myhelloworld_0.1.bb,
do_compile)
NOTE: package myhelloworld-0.1-r0: task do_compile: Started
ERROR: Function do_compile failed
NOTE: Task failed: ('function do_compile failed',
'/usr/local/projects/oetmp/work/i586-linux/myhelloworld-0.1-r0/temp/log.do_compile.10070')
ERROR: Logfile of failure stored in:
/usr/local/projects/oetmp/work/i586-linux/myhelloworld-0.1-r0/temp/log.do_compile.10070
Log data follows:
| ccache: FATAL: Could not find compiler "i586-linux-gcc" in PATH
| ERROR: Function do_compile failed
NOTE: package myhelloworld-0.1-r0: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/zoumpis/work/oe/openembedded/recipes/myhelloworld/myhelloworld_0.1.bb
do_compile failed
ERROR: Task 11 (/home/zoumpis/work/oe/openembedded/recipes/myhelloworld/myhelloworld_0.1.bb,
do_compile) failed with 256
ERROR: '/home/zoumpis/work/oe/openembedded/recipes/myhelloworld/myhelloworld_0.1.bb'
failed

Error log file : "

ccache: FATAL: Could not find compiler "i586-linux-gcc" in PATH
ERROR: Function do_compile failed"

Looking forward for your help!

-- 


Rousinopoulos Athanasios-Ilias

-- About Me--
http://zoumpis.wordpress.com
http://www.zoumpis.eu
http://en.opensuse.org/User:Zoumpis
http://en.opensuse.org/openSUSE:Medical_team

--f46d04478497254d1204b91e8ffe
Content-Type: application/octet-stream; name="myhelloworld_0.1.bb"
Content-Disposition: attachment; filename="myhelloworld_0.1.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gyqiumwx0

IApERVNDUklQVElPTiA9ICJIZWxsbyB3b3JsZCBwcm9ncmFtIgpQUiA9ICJyMCIKClNSQ19VUkkg
PSAiZmlsZTovL215aGVsbG93b3JsZC5jIgoKZG9fY29tcGlsZSgpIHsKICAgICAgICAke0NDfSAk
e0NGTEFHU30gJHtMREZMQUdTfSAke1dPUktESVJ9L215aGVsbG93b3JsZC5jIC1vIG15aGVsbG93
b3JsZAp9Cgpkb19pbnN0YWxsKCkgewogICAgICAgIGluc3RhbGwgLW0gMDc1NSAtZCAke0R9JHti
aW5kaXJ9ICR7RH0ke2RvY2Rpcn0vbXloZWxsb3dvcmxkCiAgICAgICAgaW5zdGFsbCAtbSAwNjQ0
ICR7U30vbXloZWxsb3dvcmxkICR7RH0ke2JpbmRpcn0KICAgICAgICBpbnN0YWxsIC1tIDA2NDQg
JHtXT1JLRElSfS9SRUFETUUudHh0ICR7RH0ke2RvY2Rpcn0vbXloZWxsb3dvcmxkCn0KCg==

--f46d04478497254d1204b91e8ffe
Content-Type: text/x-csrc; charset=US-ASCII; name="myhelloworld.c"
Content-Disposition: attachment; filename="myhelloworld.c"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gyqiuu3l1

I2luY2x1ZGUgPHN0ZGlvLmg+CmludCBtYWluKGludCBhcmdjLCBjaGFyKiogYXJndikKewpwcmlu
dGYoIkhlbGxvIHdvcmxkIVxuIik7CnJldHVybiAwOwp9Cg==

--f46d04478497254d1204b91e8ffe--
