Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PUvLP-0002A2-5D
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 07:05:07 +0100
Received: by wyb40 with SMTP id 40so3680536wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 22:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=PEkwblV+xFPRw54mPRlJ0vaYbvQUNnqUyJIA7DdYJ1Y=;
	b=FhUY/odXSJVuJrVuAlFXgT6tq3YqxQ51+TxqdbBAT0ol4S+NxG0x0TNGQpqfpFi7rH
	cd7WBo7yjAXH5upcOc5kcZPpUqpex7ROFNEA5CP46tGmaNl1Nb4k4M461gsHFo/+G5Z0
	BHut3buBJdiqZT7m/sW24SoZRHwFfT9E63cVc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=IlFbFIoCB3mgJR9bpG/mwecS0CvufMfz9LV4b7Qczr+5zIaXr9wqXdBsJXpjvF9aW4
	c2xN+eIF68cieWf2Xm5iDWRLTnZZURo2vikgdI20oY3Q8+gOOCF+ovnitRu9BfUaaNJz
	Q4YpFGP6qyIIFdeHmbaZBStofcV7YsLVg/XrE=
MIME-Version: 1.0
Received: by 10.227.196.78 with SMTP id ef14mr3146069wbb.165.1292911491667;
	Mon, 20 Dec 2010 22:04:51 -0800 (PST)
Received: by 10.227.155.208 with HTTP; Mon, 20 Dec 2010 22:04:51 -0800 (PST)
In-Reply-To: <AANLkTin=QemQV=Lbc5QC_9i22Bi5G88cJTJ8KxUUmD+D@mail.gmail.com>
References: <4D103319.4080002@gmail.com>
	<AANLkTin=QemQV=Lbc5QC_9i22Bi5G88cJTJ8KxUUmD+D@mail.gmail.com>
Date: Tue, 21 Dec 2010 16:34:51 +1030
Message-ID: <AANLkTikKHwj7Y6xibT-M+gchRq_rHP=2OTkri4Py-iup@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] acl_2.2.49.bb: Fix build when DISTRO_FEATURES lacks largefile.
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
X-List-Received-Date: Tue, 21 Dec 2010 06:05:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 21 December 2010 16:21, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Dec 20, 2010 at 8:54 PM, Graham Gower <graham.gower@gmail.com> wrote:
>>
>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>
> Does it function correctly at runtime ?

Can't test yet. I have problems with proxy-libintl conflicting with
libintl8 during do_rootfs...


