Return-Path: <robert_joslyn@selinc.com>
Received: from volare.selinc.com (volare.selinc.com [74.117.214.143])
	by mail.openembedded.org (Postfix) with ESMTP id E19FC787F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 23:52:56 +0000 (UTC)
Received: from pps.filterd (volare.selinc.com [127.0.0.1])
	by volare.selinc.com (8.16.0.22/8.16.0.22) with SMTP id w4BNqvNP017479; 
	Fri, 11 May 2018 16:52:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
	h=in-reply-to :
	references : to : cc : mime-version : subject : message-id : from :
	date : content-type; s=SELinc2017;
	bh=e1GkM1b8iWxBfZGbbMNOvISfR+EbZ7M19t+2AQNeRUY=;
	b=1/A0lJnl458BTUussw+gqdVqK44SyPqAmW2OZxJHaZOzYRynV7h39auylfIp77cykmXL
	rectfxlTZq68/PSy8UiD8scA5whOMV/ieYvc3R21UDqUEa1Ccs3tjw5tQOfZgZgIpvM7
	1dWXmneGkNYimbPKR3iceMKrbudGB1pka7q6RK0bv2XxAMrXr5879sen1waQ8VPepA0z
	6lW7zudE1pQQ6ufOVEPqCuuEkNtSYgfwgHQZtFeIK0lzljOyjZoOREAjkiaiokTKzDL5
	MV/jB+qaFLJiAhE61wnbZVDor5yRHufpx5LRm9rUjHsg42/xPB5dR7US0uHywLzItavo
	gw== 
Received: from edison.ad.selinc.com (edison.ad.selinc.com [10.100.0.15])
	by volare.selinc.com with ESMTP id 2hs85tr131-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 11 May 2018 16:52:57 -0700
In-Reply-To: <5119af28-2811-83b7-d913-46c5966fb1dc@xevo.com>
References: <OFC304E1FF.C64CA001-ON88258288.006EE4FE-88258288.0073C3D0@selinc.com>
	<5119af28-2811-83b7-d913-46c5966fb1dc@xevo.com>
To: Martin Kelly <mkelly@xevo.com>
MIME-Version: 1.0
X-KeepSent: 383C8BFD:A3113800-8825828A:00808857;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
Message-ID: <OF383C8BFD.A3113800-ON8825828A.00808857-8825828A.0083305B@selinc.com>
From: robert_joslyn@selinc.com
Date: Fri, 11 May 2018 16:52:55 -0700
X-MIMETrack: S/MIME Sign by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 05/11/2018 04:52:55 PM,
	Serialize by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 05/11/2018 04:52:55 PM,
	Serialize complete at 05/11/2018 04:52:55 PM,
	S/MIME Sign failed at 05/11/2018 04:52:56 PM: The cryptographic key was
	not found,
	Serialize by Router on Edison/SEL(Release 9.0.1FP9 HF139|October 06,
	2017) at 05/11/2018 04:52:57 PM,
	Serialize complete at 05/11/2018 04:52:57 PM
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8890
	signatures=668698
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meson.bbclass broken on rocko
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
X-List-Received-Date: Fri, 11 May 2018 23:52:58 -0000
Content-Type: text/plain; charset="US-ASCII"

Martin Kelly <mkelly@xevo.com> wrote on 05/09/2018 04:44:05 PM:

> From: Martin Kelly <mkelly@xevo.com>
> To: robert_joslyn@selinc.com, openembedded-devel@lists.openembedded.org, 

> Date: 05/09/2018 04:44 PM
> Subject: Re: [oe] meson.bbclass broken on rocko
> 
> On 05/09/2018 02:04 PM, robert_joslyn@selinc.com wrote:
> > I have a build based on poky that makes use of meson.bbclass from 
meta-oe
> > that is now broken after a recent update to OE-core. When using the 
latest
> > rocko branches from poky and meta-oe, my meson builds end up with the
> > wrong paths to ld and libc. For example, running ldd on one of my
> > binaries:
> > 
> > linux-vdso.so.1 (0x00007fff4f9ee000)
> > libc.so.6 =>
> > /home/robert/yocto/kiosk/poky/build/tmp/sysroots-uninative/x86_64-
> linux/lib/libc.so.6
> > (0x00007f1136f8c000)
> > /home/robert/yocto/kiosk/poky/build/tmp/sysroots-uninative/x86_64-
> linux/lib/ld-linux-x86-64.so.2
> > (0x00007f1137560000)
> > 
> > Those paths going into my home directory are obviously not correct. I
> > bisected the issue, and commit 
cead3c4925d39f8adc328007d8a8c1b23cc72842 in
> > openembedded-core is when the problem starts:
> > https://urldefense.proofpoint.com/v2/url?
> 
u=http-3A__cgit.openembedded.org_openembedded-2Dcore_commit_-3Fh-3Drocko-26id-3Dcead3c4925d39f8adc328007d8a8c1b23cc72842&d=DwIBAg&c=zVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-
> 
Gb60_N6TVnLk&r=FXexzueMZc3SeYPHXBmsGdHLENOHmHsvnD0cO1_Z0j2tHI6VqrQPNkHBCZO8dAdc&m=JSVZRc5Fq4IsIwtkdFHpTXsgF8aCQ0vP6j_F7dT5tYc&s=OutJG7fOSrT6ANwnnyxx12eHu6yepO-
> b2NWHJeP93x0&e=
> > 
> > When using the tip of rocko, I can make the issue go away by removing 
this
> > export from meson.bbclass:
> > 
> > export LDFLAGS = "${BUILD_LDFLAGS}"
> > 
> > I'm not really familiar with how this works, but it looks like the 
change
> > to BUILD_LDFLAGS in uninative.bbclass is forcing the binaries to use 
the
> > uninative ld, which isn't desired here. I assume meson.bbclass should 
not
> > be setting LDFLAGS using ${BUILD_LDFLAGS}.
> > 
> > I can send a patch removing this export, but it feels like all the 
exports
> > in meson.bbclass are incorrect. The class has been reworked and moved 
to
> > OE-core for sumo, so I can send a patch backporting the entire class 
if
> > that is preferred.
> > 
> 
> Does the issue go away with the oe-core version of meson? If so, I would 

> be in favor of backporting the entire class. From my memory of the 
> changes between meta-oe and oe-core, some of them are significant and it 

> wouldn't surprise me if important bugs were fixed.

Yes, the OE-core version of meson.bbclass works fine when I copy it to my 
rocko builds. I'll send a patch to backport the entire class.

Thanks,
Robert

