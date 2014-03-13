Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6AC605F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 02:01:58 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 10so1048772ykt.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 19:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=k0ZQ/7+ESQJmyyJgzlAGTqqxkJtIKZ70tt6eGIr9T0o=;
	b=fE3WxG5RvD/kzowoBUaJHE9zf+8h/zPgI9Qvgg86iodt8TbgjgoFMoFo0Bu7b/7Ach
	NBL7Bv9vNPioyNnvtfcTafiXC6wI6A/kR7g61+UNY1qN0RPjqm5Yh9mPYjMB9zCRoRyM
	OczUtkn13T5uQNFDTECsZl7EdIGKMBBHGQcPWIDaBPc7j5bpY+tXZHoA0n/BmQz421Le
	PLe/cBeneykUoh1I3Oc9QTbyGzFgzZZ6oYlM1dxTfudHVUau5QHdMeiAkjm42qnwPcfR
	1VsPFGhbEaVSHNm8JM/bTWJynjMc+NRckK4sSPYiDIc2Hb7owvcLyVzB4jgAdu34ugXi
	Q9DQ==
MIME-Version: 1.0
X-Received: by 10.236.126.162 with SMTP id b22mr1075708yhi.72.1394676119630;
	Wed, 12 Mar 2014 19:01:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 12 Mar 2014 19:01:59 -0700 (PDT)
In-Reply-To: <1394664760-8615-2-git-send-email-net147@gmail.com>
References: <1394664760-8615-1-git-send-email-net147@gmail.com>
	<1394664760-8615-2-git-send-email-net147@gmail.com>
Date: Wed, 12 Mar 2014 23:01:59 -0300
X-Google-Sender-Auth: LMa_xjf-4rNwiYb4viwPxLUwjHE
Message-ID: <CAP9ODKpSGubOE6p7=Z=RprvWEkgj=GPsEyU68rbNVQTXHhRyhA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v5 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Thu, 13 Mar 2014 02:02:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Wed, Mar 12, 2014 at 7:52 PM, Jonathan Liu <net147@gmail.com> wrote:
> This adds the necessary target packages for development with all of the
> Qt 5 modules.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>

| Computing transaction...error: Can't install
qtwayland-dev-5.2.1+git0+573d0ee5ba-r0.0@cortexa9hf_vfp_neon: no
package provides qtwayland = 5.2.1+git0+573d0ee5ba-r0.0
|
| Saving cache...
|
| WARNING: /home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/run.populate_sdk_image.29400:1
exit 1 from
|   smart --data-dir=${target_rootfs}/var/lib/smart install -y
${pkgs_to_install}
| DEBUG: Python function do_populate_sdk finished
| ERROR: Function failed: populate_sdk_image (log file is located at
/home/otavio/hacking/customer/companytec/yocto/build/tmp/work/wandboard_solo-oel-linux-gnueabi/qsiv-demo-image/1.0-r0/temp/lo

Please fix this and test the combinations of enable/disable features.
They seem not well tested.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

