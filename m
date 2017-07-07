Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id B8A8D71C75
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jul 2017 19:38:56 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id c11so60148338wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jul 2017 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9sG2rUUrC74dxdB27lkkzyafJSfy6LJaUHllvUPuReM=;
	b=d8C9feWC1ZQrHtDESA9JAqNHvR0jJuVSGyqdDmv0u29gqy3+ktsaKyHNZVxy+KJxqD
	v8p8TkEfyw3eGHs89x+WMLilF+phBKk9HdSzoFI5u/xd6VgcKWIjWCQA6ilVU3D6s9r6
	Z5oezqIiJpSYQO/+RUowtjfwGZqwf4W4V5f18rPZklE8kJUXZWLzUp2LhApB5SbkSwpR
	ESMPHxtokPdTlskE69IpvTSzFZmhRZQCMHcyBRtyf5uJAbuodoPLLB6fXYhRkh5yLoN8
	+x7TaWZYSvNbO0cHIhbENOHxOvlv9XAV9BBhE2iOgtITNY2Vyn8OftT3X0MhyJFxocBY
	AwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9sG2rUUrC74dxdB27lkkzyafJSfy6LJaUHllvUPuReM=;
	b=nTUTXiruaO23slTP7glfzQvLnnTFK5Ch3u3JF8imtxYO4Z69gTIxopZTjMMmAhNHMi
	KSj33eDI/DG/d0sPvgvtzjX2kkup02ThXBeinMBazN+ZcItnjKJQR+5x0JlVPUtQ2XKu
	eIdxESUdDHUqUTp8FANSc/am7yq7MZh6XPnD4FzxjWoqBEZ/SAMSxYVGsPm7rcg/Lan0
	ecje8dCpKWldaNWh0eDbEf+mLANePb+hqAxhopV/ja+7j49cEmI5yXYQVN5EEZKGqmkO
	31Xu2JLSKLHXXe914p8hgHQ4/kA3uyL1MKA87KiEvpQSwmYzNCoosxwRa8G2Ptbv7dN+
	+jYg==
X-Gm-Message-State: AIVw110UsuFkwJ/PHiaH/kssCMA2BKxgnw8BT7mlWQJMN3wM8VYpqfFx
	0h49X6OtslmRxYUezUJOUpZ+46gDyQ==
X-Received: by 10.80.158.199 with SMTP id a65mr3295562edf.169.1499456337459;
	Fri, 07 Jul 2017 12:38:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Fri, 7 Jul 2017 12:38:26 -0700 (PDT)
In-Reply-To: <CAHvQdo1KF6MqXRHcJuGrPapHqcHW24_oTOFAYDdEve-YNLUzwg@mail.gmail.com>
References: <CAHvQdo1KF6MqXRHcJuGrPapHqcHW24_oTOFAYDdEve-YNLUzwg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jul 2017 12:38:26 -0700
Message-ID: <CAMKF1sr1gDGLSBtLW01sNxjFG+aZq1hu8mi_O2We8UhzsDBFNg@mail.gmail.com>
To: Johannes Pointner <h4nn35.work@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: pyro samba
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
X-List-Received-Date: Fri, 07 Jul 2017 19:38:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 7, 2017 at 11:33 AM, Johannes Pointner
<h4nn35.work@gmail.com> wrote:
> Hello Armin,
>
> would it be ok to consider commit:
>
> 88885fc01 samba: upgrade to 4.6.5
>

if this is big-fix only release then may be.

> for pyro which fixes CVE-2017-7494 (Remote code execution from a writable share)
> or should only the fix for the CVE be backported?
> I took a look into the release notes since 4.6.2 and there are a lot
> of bugfixes included besides the CVE fix.
>
> Thanks,
> Hannes
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

