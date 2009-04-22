Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lwas1-0002mb-E1
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 13:44:05 +0200
Received: by yw-out-1718.google.com with SMTP id 9so104503ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 04:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=7Jf8f/XoWCPt3juxlEOSNithxmdRxVhLQLWMBhSnA0g=;
	b=Oom3riiILiNkPkC/TTzvuYslE+z3V1lU3jgv1T6ORat/M0B8RdsqHQDtcurrvcFm/5
	xsDrDp7hMXHnRDOKyJ2/Jv4/Y8uOKYKz6WVUnl+izXDnl2y1WW5UZh0yuNVFZVd0Egw6
	wLr14eg81IxfPjINwuX+BrVedDqCi5Fl5njdA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=H7kmrKQwyPpNPpu2Di8JvELBmIyb9gTfbgg1CFnzWJzRWTWN7ueVK/jSHQkWU4fXCR
	A1lA6wDtjjSGDgDjhbUzYN0+Kfw/uf+lHGo1MUbJHa342HZcMH4vM+rwbTZ1LrE3ha5N
	ykXX2lwgf1mpQXyGslBGaWcS8hvqsDHD4aTNE=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.125.14 with SMTP id x14mr2788638anc.136.1240400374241; 
	Wed, 22 Apr 2009 04:39:34 -0700 (PDT)
In-Reply-To: <20090422032736.GB11408@denix.org>
References: <1238399997-6016-1-git-send-email-khimov@altell.ru>
	<c384c5ea0904211352o406880cbp2846efd6e0125038@mail.gmail.com>
	<87eivlef8t.fsf@neumann.lab.ossystems.com.br>
	<20090422032736.GB11408@denix.org>
Date: Wed, 22 Apr 2009 08:39:34 -0300
X-Google-Sender-Auth: fd00085cd7aed730
Message-ID: <be7a9f3d0904220439t10df3305ka30dd2df94c6ff9d@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: reorder do_rootfs
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
X-List-Received-Date: Wed, 22 Apr 2009 11:44:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Denys,

On Wed, Apr 22, 2009 at 12:27 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Apr 21, 2009 at 08:52:50PM -0300, Otavio Salvador wrote:
>> Hello Leon,
>>
>> Leon Woestenberg <leon.woestenberg@gmail.com> writes:
>>
>> > On Mon, Mar 30, 2009 at 9:59 AM, Roman I Khimov <khimov@altell.ru> wrote:
>> >> Places do_rootfs function before do_install in image creation process.
>> >>
>> >> This change allows multiimage builds, when one image depends on another (before
>> >> that second image creation raced with do_rootfs for the first one) and uses
>> >> it for some purpose.
>> >>
>> >> Multiimage builds are useful in situations like creating an installer image
>> >> with initramfs (built in OE) and an image of the target FS (also built in OE)
>> >> or for building virtualized system images to be placed on target FS.
>> >> ---
>> >
>> > This looks *very* useful.
>> >
>> > However, this might break stuff as it is intrusive. So HEADS UP everyone! :-)
>>
>> [...]
>>
>> Mind to explain how it can break things?
>
> On the other hand - mind to explain how it can be so very useful? :) Any real
> word examples?

Quite simple, here in company we build:

 osthindesktop-lite-image
    depends on osthindesktop-common-initramfs-image
    depends on osii-client-image

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


