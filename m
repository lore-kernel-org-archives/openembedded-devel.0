Return-Path: <SimonG@seaward.co.uk>
X-Greylist: delayed 399 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Sep 2014 09:13:35 UTC
Received: from mail1.bemta5.messagelabs.com (mail1.bemta5.messagelabs.com
	[195.245.231.151])
	by mail.openembedded.org (Postfix) with ESMTP id 29464605BD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 09:13:35 +0000 (UTC)
Received: from [85.158.139.211:23971] by server-15.bemta-5.messagelabs.com id
	C4/30-12002-03661145; Thu, 11 Sep 2014 09:06:56 +0000
X-Env-Sender: SimonG@seaward.co.uk
X-Msg-Ref: server-8.tower-206.messagelabs.com!1410426414!13759821!1
X-Originating-IP: [89.206.246.114]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10762 invoked from network); 11 Sep 2014 09:06:54 -0000
Received: from unknown (HELO smtp.seaward.co.uk) (89.206.246.114)
	by server-8.tower-206.messagelabs.com with SMTP;
	11 Sep 2014 09:06:54 -0000
To: openembedded-devel@lists.openembedded.org
Message-ID: <OFDBB8BDB4.AD422CF3-ON80257D50.0031C1EB-80257D50.00321358@LocalDomain>
From: "Simon George" <SimonG@seaward.co.uk>
Date: Thu, 11 Sep 2014 10:06:54 +0100
MIME-Version: 1.0
X-KeepSent: DBB8BDB4:AD422CF3-80257D50:0031C1EB; name=$KeepSent; type=4
X-Mailer: Lotus Notes Release 8.5.1FP4 July 25, 2010
X-Disclaimed: 15879
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Error while bitbake meta-toolchain-qt5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Sep 2014 09:13:40 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

I think I am also having the same issue that Switesh originally reported,=20
is there a solution?=20
If so I would be grateful if you could tell me the steps to take to solve=20
the issue.

My console output is:

engineering@SELLT099:~/fsl-community-bsp/build$ bitbake meta-toolchain-qt5
...
...=20
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL=20
git://qt.gitorious.org/qt/qtwayland.git;branch=3Dstable, attempting MIRRORS=
=20
if available
ERROR: Fetcher failure: Unable to find revision=20
a237778666666ab77c4e8e6b501cf0fbe7c9223e in branch stable even from=20
upstream
ERROR: Function failed: Fetcher failure for URL:=20
'git://qt.gitorious.org/qt/qtwayland.git;branch=3Dstable'. Unable to fetch 

URL from any source.
ERROR: Logfile of failure stored in:=20
/home/engineering/fsl-community-bsp/build/tmp/work/i686-linux/qtwayland-nat=
ive/5.2.1+gitAUTOINC+a237778666-r0/temp/log.do=5Ffetch.2882
ERROR: Task 1763=20
(/home/engineering/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/qtwayl=
and-native=5Fgit.bb,=20
do=5Ffetch) failed with exit code '1'
WARNING: Failed to fetch URL=20
git://qt.gitorious.org/qt/qtwayland.git;branch=3Dstable, attempting MIRRORS=
=20
if available
ERROR: Fetcher failure: Unable to find revision=20
573d0ee5ba86d99095f217ea9e19172bfc5e75fd in branch stable even from=20
upstream
ERROR: Function failed: Fetcher failure for URL:=20
'git://qt.gitorious.org/qt/qtwayland.git;branch=3Dstable'. Unable to fetch 

URL from any source.
ERROR: Logfile of failure stored in:=20
/home/engineering/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky=
-linux-gnueabi/qtwayland/5.2.1+gitAUTOINC+573d0ee5ba-r0/temp/log.do=5Ffetch=
.2883
ERROR: Task 827=20
(/home/engineering/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/qtwayl=
and=5Fgit.bb,=20
do=5Ffetch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 4147 tasks of which 4145 didn't need to be=20
rerun and 2 failed.
Waiting for 0 running tasks to finish:
=20
Summary: 2 tasks failed:
 =20
/home/engineering/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/qtwayla=
nd-native=5Fgit.bb,=20
do=5Ffetch
 =20
/home/engineering/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/qtwayla=
nd=5Fgit.bb,=20
do=5Ffetch
Summary: There were 2 WARNING messages shown.
Summary: There were 4 ERROR messages shown, returning a non-zero exit=20
code.
engineering@SELLT099:~/fsl-community-bsp/build$

the 2 log files mentioned are here:

        log.do=5Ffetch.2882  http://pastebin.com/3Nk1Z4D9
        log.do=5Ffetch.2883 http://pastebin.com/MWeML9Wt

        I am also on branch daisy and as of the time of this email the=20
branch was up to date.=20

        any help would be appreciated.=20

regards,
        Simon


------------------------------------------------
This email and any files transmitted with it are confidential and intended =
solely for the use of the individual or entity to whom they are addressed. =
If you have received this email in error please notify the system manager.

This footnote also confirms that this email message has been swept by the M=
essageLabs Email Security System for the presence of computer viruses.

Seaward Group, Bracken Hill, South West Industrial Estate, Peterlee, County=
 Durham. SR8 2SW, England. Company Registration: 1674384

For the sake of the environment, please do not print this email unless you =
really need to.

