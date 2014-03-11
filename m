Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3B76F7BD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 14:26:49 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f10so8621220yha.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 07:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=cDhqC3CfGH2Y9f6xaTv94TveZRzvM1++7eXgsNF771g=;
	b=qVRjxG3cBaEng4InhZLoGefZ0/tKm2dS7s5bQbcJqKCurN+SiDlxW70wxXFTlOzS1l
	sipBL3non795Wn7Z0GVOUAFtG+bnNvEF2ViNDlNSG8q6tRBg4neXDGUJcxLh43Kni2cJ
	gpU4lh+21v/AixgoZqigTg2Sh/rFLFSI8vuzAqIvMyAMoZtf+BAq9EtjQMkhjwrKdEb0
	gRgO6vEQb2qYBe5cFaGAICKK9q4uqyDhxMUQjTGuqJ6NSfJJIl/Tkse1nBgF7Zzx0NM6
	d67Jme79K66n5ytFkFOkfoxg2W8NO1PRDAndcc54mhhKZAPmL2S/70hmsPH4ESHD1WjH
	xjcg==
MIME-Version: 1.0
X-Received: by 10.236.118.212 with SMTP id l60mr53742917yhh.78.1394548010379; 
	Tue, 11 Mar 2014 07:26:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 11 Mar 2014 07:26:50 -0700 (PDT)
In-Reply-To: <20140311140858.GA2137@jama>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
	<1394227575-27897-3-git-send-email-lauren.post@freescale.com>
	<20140311140858.GA2137@jama>
Date: Tue, 11 Mar 2014 11:26:50 -0300
X-Google-Sender-Auth: dL54sKH8qYRudKflUiniIFjncQ0
Message-ID: <CAP9ODKrs4hJsAGJ4E4TWtZiKy+seaJLFWq9wcW72DkX_qnDtkA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/7] can-utils: Create git version
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
X-List-Received-Date: Tue, 11 Mar 2014 14:26:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Lauren and Martin,

On Tue, Mar 11, 2014 at 11:08 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Mar 07, 2014 at 03:26:11PM -0600, Lauren Post wrote:
>> Linux CAN network development utilities - newer version than canutils
>>
>> Signed-off-by: Lauren Post <lauren.post@freescale.com>
>> ---
>>  .../recipes-extended/socketcan/can-utils_git.bb    |   14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>  create mode 100644 meta-oe/recipes-extended/socketcan/can-utils_git.bb
>>
>> diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
>> new file mode 100644
>> index 0000000..53632c8
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
>> @@ -0,0 +1,14 @@
>> +SUMMARY = "Linux CAN network development utilities"
>> +DESCRIPTION = "Linux CAN network development"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
>
> Please use something from source tree, not COREBASE.

I did a check in the contents and it seems to be a mix of licenses:

$: licensecheck -r *
asc2log.c: BSD (3 clause)
autogen.sh: *No copyright* UNKNOWN
bcmserver.c: *No copyright* UNKNOWN
canbusload.c: BSD (3 clause)
can-calc-bit-timing.c: GPL
candump.c: BSD (3 clause)
canfdtest.c: GPL
canframelen.c: BSD (3 clause)
canframelen.h: BSD (3 clause)
cangen.c: BSD (3 clause)
cangw.c: BSD (3 clause)
canlogserver.c: BSD (3 clause)
canplayer.c: BSD (3 clause)
cansend.c: BSD (3 clause)
cansniffer.c: BSD (3 clause)
include/linux/can.h: BSD (3 clause)
include/linux/can/bcm.h: BSD (3 clause)
include/linux/can/error.h: BSD (3 clause)
include/linux/can/gw.h: BSD (3 clause)
include/linux/can/isotp.h: BSD (3 clause)
include/linux/can/netlink.h: UNKNOWN
include/linux/can/raw.h: BSD (3 clause)
isotpdump.c: BSD (3 clause)
isotprecv.c: BSD (3 clause)
isotpsend.c: BSD (3 clause)
isotpserver.c: BSD (3 clause)
isotpsniffer.c: BSD (3 clause)
isotptun.c: BSD (3 clause)
lib.c: BSD (3 clause)
lib.h: BSD (3 clause)
log2asc.c: BSD (3 clause)
log2long.c: BSD (3 clause)
slcan_attach.c: BSD (3 clause)
slcand.c: GPL (v2 or later) (with incorrect FSF address)
slcanpty.c: GPL (v2 or later) (with incorrect FSF address)
terminal.h: BSD (3 clause)

>> +DEPENDS = "libsocketcan"
>> +
>> +SRC_URI = "git://git.gitorious.org/linux-can/can-utils.git;protocol=git;branch=master"

I'd use:

SRC_URI = "git://gitorious.org/linux-can/can-utils.git;protocol=git;branch=master"

As this is the common form used in the current recipes.

>> +SRCREV = "67a2bdcd336e6becfa5784742e18c88dbeddc973"
>
> Please set PV.

As it has not been tagged in the repository I'd use:

PV = "0.0+git${SRCPV}"

here.

>> +S = "${WORKDIR}/git"
>> +
>> +inherit autotools pkgconfig
...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

