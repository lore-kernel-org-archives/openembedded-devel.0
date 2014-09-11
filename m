Return-Path: <switesh.fulpagare@mindastoneridge.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 22B2971462
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 10:18:52 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id im17so483759vcb.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 03:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ct3j5jBwnehBm2GaQtaXYe3hp0nXrKeYFREw3tcOwKc=;
	b=doKcq1S854cK/fHhWYxn6pDhoBeDH3xQH7xrtRF9ZuFz4Ih0i7EqrLbfab4jc4wYAY
	r11O1MERw5UDcaqtKnaxPPhQfgCvYB0MizRvM+qez8rsT6mlXh5f+KB+HdHL8e1HEbX+
	vuJy9cyYWUFAAHLhWP/XWH7sgOb+miEPOOTjLizYxL52VAPEPMzhrWYepj1xvCkDjIQY
	k/OXIbxHEvppoSWVU2fRWpYnYZUTF5MjckLIdzSiQ0tM32l1uhyG7r1s4QIfj+1LWeED
	uQaVUxuhY9Py3lcN+HSo9ytPbvElJvingkH1A9rDsYMBGkCz28/53GibVYPqIOY9NzY7
	7IbQ==
X-Gm-Message-State: ALoCoQmLnCmBG83PiZYrm5oCeN+byt2bHL/H8YVgVBp3Dx5cpncWDywkt4twfgMHYdvvq3O2V4OR1jxdFXRj5ry3SAyBXrhOT7yp5JOweUW90EBXXR4UXUz91XOt4cnU7MecjjA/Q7piAuEIk76l/psu+wjnHwadeA==
MIME-Version: 1.0
X-Received: by 10.52.163.52 with SMTP id yf20mr12259vdb.40.1410430733251; Thu,
	11 Sep 2014 03:18:53 -0700 (PDT)
Received: by 10.52.245.73 with HTTP; Thu, 11 Sep 2014 03:18:53 -0700 (PDT)
In-Reply-To: <OFDBB8BDB4.AD422CF3-ON80257D50.0031C1EB-80257D50.00321358@LocalDomain>
References: <OFDBB8BDB4.AD422CF3-ON80257D50.0031C1EB-80257D50.00321358@LocalDomain>
Date: Thu, 11 Sep 2014 15:48:53 +0530
Message-ID: <CALRGHr_Uf9qWFreNHoVXQi8pekRUzZDhrvBOLBr1hZ--4uMLGA@mail.gmail.com>
From: Switesh Fulpagare <switesh.fulpagare@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 11 Sep 2014 10:19:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Simon,
  This fetcher failure problem is solved by following patch -

diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/
qtwayland-native_git.bb
index 988aa98..64485de 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -4,4 +4,5 @@ require ${PN}.inc
 # qtwayland wasn't released yet, last tag before this SRCREV is 5.0.0-beta=
1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5
5.2.1

-SRCREV =3D "a237778666666ab77c4e8e6b501cf
0fbe7c9223e"
+QT_MODULE_BRANCH =3D "dev"
+SRCREV =3D "573d0ee5ba86d99095f217ea9e19172bfc5e75fd"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/
qtwayland_git.bb
index 789a882..c192914 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -4,6 +4,7 @@ require ${PN}.inc
 # qtwayland wasn't released yet, last tag before this SRCREV is 5.0.0-beta=
1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5
5.2.1

+QT_MODULE_BRANCH =3D "dev"
 SRCREV =3D "573d0ee5ba86d99095f217ea9e19172bfc5e75fd"

 SRC_URI +=3D " \


If you till have any doubt please revert.


On Thu, Sep 11, 2014 at 2:36 PM, Simon George <SimonG@seaward.co.uk> wrote:

> I think I am also having the same issue that Switesh originally reported,
> is there a solution?
> If so I would be grateful if you could tell me the steps to take to solve
> the issue.
>
> My console output is:
>
> engineering@SELLT099:~/fsl-community-bsp/build$ bitbake meta-toolchain-qt=
5
> ...
> ...
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: Failed to fetch URL
> git://qt.gitorious.org/qt/qtwayland.git;branch=3Dstable, attempting MIRRO=
RS
> if available
> ERROR: Fetcher failure: Unable to find revision
> a237778666666ab77c4e8e6b501cf0fbe7c9223e in branch stable even from
> upstream
> ERROR: Function failed: Fetcher failure for URL:
> 'git://qt.gitorious.org/qt/qtwayland.git;branch=3Dstable'. Unable to fetc=
h
>
> URL from any source.
> ERROR: Logfile of failure stored in:
>
> /home/engineering/fsl-community-bsp/build/tmp/work/i686-linux/qtwayland-n=
ative/5.2.1+gitAUTOINC+a237778666-r0/temp/log.do_fetch.2882
> ERROR: Task 1763
> (/home/engineering/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/
> qtwayland-native_git.bb,
> do_fetch) failed with exit code '1'
> WARNING: Failed to fetch URL
> git://qt.gitorious.org/qt/qtwayland.git;branch=3Dstable, attempting MIRRO=
RS
> if available
> ERROR: Fetcher failure: Unable to find revision
> 573d0ee5ba86d99095f217ea9e19172bfc5e75fd in branch stable even from
> upstream
> ERROR: Function failed: Fetcher failure for URL:
> 'git://qt.gitorious.org/qt/qtwayland.git;branch=3Dstable'. Unable to fetc=
h
>
> URL from any source.
> ERROR: Logfile of failure stored in:
>
> /home/engineering/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-po=
ky-linux-gnueabi/qtwayland/5.2.1+gitAUTOINC+573d0ee5ba-r0/temp/log.do_fetch=
.2883
> ERROR: Task 827
> (/home/engineering/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/
> qtwayland_git.bb,
> do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 4147 tasks of which 4145 didn't need to be
> rerun and 2 failed.
> Waiting for 0 running tasks to finish:
>
> Summary: 2 tasks failed:
>
> /home/engineering/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/
> qtwayland-native_git.bb,
> do_fetch
>
> /home/engineering/fsl-community-bsp/sources/meta-qt5/recipes-qt/qt5/
> qtwayland_git.bb,
> do_fetch
> Summary: There were 2 WARNING messages shown.
> Summary: There were 4 ERROR messages shown, returning a non-zero exit
> code.
> engineering@SELLT099:~/fsl-community-bsp/build$
>
> the 2 log files mentioned are here:
>
>         log.do_fetch.2882  http://pastebin.com/3Nk1Z4D9
>         log.do_fetch.2883 http://pastebin.com/MWeML9Wt
>
>         I am also on branch daisy and as of the time of this email the
> branch was up to date.
>
>         any help would be appreciated.
>
> regards,
>         Simon
>
>
> ------------------------------------------------
> This email and any files transmitted with it are confidential and intende=
d
> solely for the use of the individual or entity to whom they are addressed=
.
> If you have received this email in error please notify the system manager=
.
>
> This footnote also confirms that this email message has been swept by the
> MessageLabs Email Security System for the presence of computer viruses.
>
> Seaward Group, Bracken Hill, South West Industrial Estate, Peterlee,
> County Durham. SR8 2SW, England. Company Registration: 1674384
>
> For the sake of the environment, please do not print this email unless yo=
u
> really need to.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

--=20
=E2=80=9CThe contents of this e-mail message and any attachments are confid=
ential=20
and are intended solely for addressee. The information may also be legally=
=20
privileged. This transmission is sent in trust, for the sole purpose of=20
delivery to the intended recipient. If you have received this transmission=
=20
in error, any use, reproduction or dissemination of this transmission is=20
strictly prohibited. If you are not the intended recipient, please=20
immediately notify the sender by reply e-mail or phone and delete this=20
message and its attachments, if any.=E2=80=9D

