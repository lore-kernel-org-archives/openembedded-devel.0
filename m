Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LwwDM-00079i-RM
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 12:31:32 +0200
Received: by yw-out-1718.google.com with SMTP id 9so301451ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2009 03:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TuioNwlZZIkmClqWMXOKFJzO+ENfVSNmE/Inc5yUYVg=;
	b=H+pXxs0XtjrmGhbWzRo0Cav3n3W4mT/IMVonMucx8p9bfW+8/v+GfTzI+j1FS7r5IH
	7scPaCVsUuZAB1845EndR7rzIRuCdkizdvbqXcEOeFLrEaEQ1H4oAAOPSMMvffmvv1hq
	iNgW8I3yauedRrASjCB2W4JJSCuco57yXEwC0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ajYU/sSRpXtjxMTIhThWxibVVY0W8MWkINnDmRc9ynwrxBXADKz3eYHvbpiuiIBGJ9
	0j8x3b9Vw/hO4v0B/yPIa2eyt4c7lIaD4DkQPp2xpg4zSjyXTMTQNtVcl0F8pg3kDQzo
	zO9NHrg4u84mCmhjY9XWDeiGrDZ9BI8QHHnMA=
MIME-Version: 1.0
Received: by 10.90.106.3 with SMTP id e3mr1040587agc.54.1240482415573; Thu, 23 
	Apr 2009 03:26:55 -0700 (PDT)
In-Reply-To: <200904220859.23657.khimov@altell.ru>
References: <1238404723-8814-1-git-send-email-khimov@altell.ru>
	<c384c5ea0904211351l607d74d2s2a010bf7a4138977@mail.gmail.com>
	<200904220859.23657.khimov@altell.ru>
Date: Thu, 23 Apr 2009 12:26:55 +0200
Message-ID: <c384c5ea0904230326v3742658ah5c8afd8d156a1c08@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: use ROOTFS_SIZE for gzip'd images
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
X-List-Received-Date: Thu, 23 Apr 2009 10:31:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Wed, Apr 22, 2009 at 6:59 AM, Roman I Khimov <khimov@altell.ru> wrote:
> On Wednesday 22 April 2009 00:51:15 Leon Woestenberg wrote:
>> Hello,
>>
>> On Mon, Mar 30, 2009 at 11:18 AM, Roman I Khimov <khimov@altell.ru> wrote:
>> > Make ext2.gz and ext3.gz images use ROOTFS_SIZE parameter for genext2s
>> > (as non-compressed ext2 and ext3 does).
>> >
>> > This allows to use IMAGE_EXTRA_SPACE configuration.
>>
>> Could you explain how this works?
>
> IMAGE_EXTRA_SPACE was brought into OE with commit
> d38f1dd24dd6ed94408aa49aad33e46634a129ff, see comment for that. This one just
> fixes it for compressed images.
>

Hmm, this part runs on the host:

ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}


Would this correctly work if my host has a, say 16kB block, XFS
filesystem? I.e. would "du -ks" correctly estimate the amount of
ext2/3 blocks needed to layout the rootfs on ext2/3?

Regards,
-- 
Leon


