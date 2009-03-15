Received: from [209.85.198.249] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ticktock35@gmail.com>) id 1LihB7-00010J-OD
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Mar 2009 04:38:24 +0100
Received: by rv-out-0708.google.com with SMTP id c5so753882rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Mar 2009 20:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=cfjEEDJPPMYCDpkuLOAYMKAiV/iYnleklcHMSOVEw04=;
	b=EZkEIYG7QUtkZ3MZ9FPpLU9ZLBahsb1GpDGv/GCYx/JTILla74HXiDJdFWzjsqkm52
	xQFk1duJXxGD4ik6lenCjQDyYMJk8wing02wv7iEtsJRQpqiLdLysXoQs/BCL3Dz5Q7F
	MFfjsoKrD5YyCraKQsBM+IZ1wFWbgSaDdNswA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EVUPdYeza8XGPJY1SKIP2Aaegvjc2AqSPJmTh4cAY0TlWzQL75YZZCbXd8+hPyJ1Pg
	DMAvxLmqJTuPTnHrA7n6QmlsvcSu34MrGVMNiozZaHJKyEMyntNVedx+aacWGCt0g5q+
	fPu/3iNTgiKuEnusSdEZtFvONZOA29GlzkdOY=
MIME-Version: 1.0
Received: by 10.141.50.11 with SMTP id c11mr1503794rvk.139.1237088272180; Sat, 
	14 Mar 2009 20:37:52 -0700 (PDT)
In-Reply-To: <1237070100.9302.8.camel@utx.utx.cz>
References: <1237070100.9302.8.camel@utx.utx.cz>
Date: Sun, 15 Mar 2009 11:37:52 +0800
Message-ID: <565965130903142037q21baab90h86bdb37f03ba68ed@mail.gmail.com>
From: Tick <ticktock35@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Opkg devel List <opkg-devel@googlegroups.com>
X-SA-Exim-Connect-IP: 209.85.198.249
X-SA-Exim-Mail-From: ticktock35@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: "opkg install ncurses-terminfo" needs 1GB of memory
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
X-List-Received-Date: Sun, 15 Mar 2009 03:38:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
 What version of opkg and OE branch do you use?
Do you have the backstrace and log when opkg failed?
1GB should be much much more than enough for normal package.
The more detail description and information the more clue for me to
figure out what's going on.
Thanks.

Regards,
Tick
2009/3/15 Stanislav Brabec <utx@penguin.cz>:
> Hallo.
>
> While trying to do "make upgrade", opkg failed on ncurses-terminfo. It
> ended with dead swapping or being targeted b y OOM killer.
>
> Trying to proceed, I added swap to get 800 MB of virtual memory. The
> result was 30 minutes of swapping and failure - ipkg fails on "fork
> failed" error. I don't know, whether 1GB would be enough, but it is
> surely far more than one would expect from package manager for PDA
> device.
>
> Does anybody else see this regression? I have 822 packages installed.
>
>
> ________________________________________________________________________
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


