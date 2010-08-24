Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OnvD3-0005Qd-2h
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 17:14:52 +0200
Received: by eyb7 with SMTP id 7so3299472eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=l3g3FL5zq2bSjIGew0QMuc5k2hEz1GUFPcUU+ZXHZhE=;
	b=KVM507IWywXxVZfwYea5Hnm5BjQSojHH4tcDlI1phWM2rMELd3WgYly2a26vu9BvOG
	0YHD3/YdhdMQeYoHzNLkdXIkZhMAqMc8fsnUjQzC66zFF3M4yFpIGURC6+0xW087IUVJ
	j2uPbIuyXE8aJXT3EChlk68Syi68xplsEaQBQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dQZ6E1wmCT99QwxOryh+eVF5m8olfMefntBPdLTaru7oWrNDJFgucpHxdWbT+O6LXB
	1UOzUzPmn52g1Pp9J1872c7+Fdrawpz1dmcbGbqe/F9rtXVdBxt9+/H2rSMXODLy+D0d
	KvPOpggdsd2m5CcvHX80NMYZJobTNo/7IMWJI=
MIME-Version: 1.0
Received: by 10.216.231.83 with SMTP id k61mr890356weq.88.1282662625790; Tue,
	24 Aug 2010 08:10:25 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Tue, 24 Aug 2010 08:10:25 -0700 (PDT)
In-Reply-To: <4C73D124.9080501@balister.org>
References: <4C73D124.9080501@balister.org>
Date: Tue, 24 Aug 2010 11:10:25 -0400
Message-ID: <AANLkTinFTYP58bGFXGyP5p4YcngLUm117osaNNZgFst3@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Has the file:// behavior changed in SRC_URI
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
X-List-Received-Date: Tue, 24 Aug 2010 15:14:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 24, 2010 at 10:03 AM, Philip Balister <philip@balister.org> wrote:
> I know I used to be able to use a local directory with kernel source like
> this:
>
> SRC_URI = "file:///home/balister/kernel_source"
>
> but now all that is copied to ${WORK} is an empty directory. This is with
> bitbake 1.10.0.
>
> Any thoughts?

I don't know about the above, but as a related note, srctree is now
working.  I've not tested with a kernel recipe yet, but it has been
tested with qt and autotools recipes:

http://cgit.bec-systems.com/cgit.cgi/autotools-demo/tree/autotools-demo.bb
http://cgit.bec-systems.com/cgit.cgi/qt-overo-palo-gpio/tree/qt-overo-palo-gpio.bb

Thanks,
Cliff

-- 
=================
http://bec-systems.com


