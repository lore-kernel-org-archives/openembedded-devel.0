Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 53BBC6057B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 04:22:08 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id y89so29634899qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 21:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=w0A0rBAM2IIj2Co8KP2ZhAG1UhkoAmuACgMbi7ZsO7k=;
	b=B2d9kLmPu/f9G9nikYPtbvi2Iamt+GI6MvtoC8Mv+wqabyKrdYgC6hZC2UUzA3umra
	DI161I3VBNa3UzDJfghEiYCqs7SjVsupq/UZWUJr2rZitjVFDruyOPGzkWGItd04664L
	S1lxTg5iNE74n4NcuvHigqMI3F0A7O9pfz51nSCtSjC3uAwxZauVOj6peoG6gobLjkAx
	2KlAzACIGl4gsogLbzLCodkud5lVw5wcO5brxnE4QOI6EViztbyh8Gcr0ig8mzKIK6cS
	XJ2fzZO6ZGo3DLvcskve+lEvhrYIf8oEOsr78COwOxwlWiDNLNMdilNzMOLIBs7vu6g1
	F38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=w0A0rBAM2IIj2Co8KP2ZhAG1UhkoAmuACgMbi7ZsO7k=;
	b=VLco8PzgtFEW0EXo4z/ESmLgQsxAo2QNw5XDDGBA8rJYABkTP5rZCv1QQcQWTRXZu/
	GInEgIHxTDl3kTvKY4QOywkaOo/Ea8xXaSF9kdlIXmA/d+k1GMr/rXUBoPBroZNdFSL3
	9tmRq8XujaQV+AfU7aQub/og92y7clvvNqw/Zt83ADBEIB5QDtlvEeSE+Bakqy7GZnND
	qkLpVfAeYagq86IGQjs7j8+DcxZeN9cHaj83pGtUb25MtqsLFTtXxznXK4g+N2Mq7fsc
	0g/NDUV2tTfVd/fRT3bqGSJIiOYPm1DznpooiPkCXxSCJrdN99xOBQEbpbnTnjB3eYMb
	VwOg==
X-Gm-Message-State: AD7BkJK5oJaemRxMKlXMfZ3d4y0psMxkDR4HWHjcQtiKyOMq6pgy2m7CVVl2akiOr0qlcs4MG7wyR5HjUw7GTg==
MIME-Version: 1.0
X-Received: by 10.140.148.134 with SMTP id 128mr8426530qhu.98.1458793328660;
	Wed, 23 Mar 2016 21:22:08 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Wed, 23 Mar 2016 21:22:08 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Wed, 23 Mar 2016 21:22:08 -0700 (PDT)
In-Reply-To: <CAMZfsd6f67zTGSsSfQdVViX69qykeNmKE6gP+u60WAOKGOWodA@mail.gmail.com>
References: <CAMZfsd6f67zTGSsSfQdVViX69qykeNmKE6gP+u60WAOKGOWodA@mail.gmail.com>
Date: Wed, 23 Mar 2016 21:22:08 -0700
Message-ID: <CAMKF1sqxb2y6KPxNbB5wVSvRjN2vCq5m_TT08TzjGFxvPBAp_A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Unable to Build due to qtbase error
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
X-List-Received-Date: Thu, 24 Mar 2016 04:22:08 -0000
Content-Type: text/plain; charset=UTF-8

Do you have opengl in distro features
On Mar 23, 2016 7:49 PM, "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
wrote:

> Hello,
>
> I have been trying to build an image using meta-qt5 for quite a while now.
> I am building using the meta-intel layer for an x86-64 architecture. The
> build keeps failing due to qtbase. The error log is here:
> http://pastebin.com/qcRQxTsH
>
> I cannot for the life of me figure out how to fix this error. Any help
> would be greatly appreciated!
>
> -Ryan
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

