Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 02F7779164
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:28:49 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id n21-v6so10671276oig.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 14:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=t1ilkGUT3DWfZp8wCJoPiiF9++5cxEKVLX1zA8f0UW4=;
	b=iQHPvoSi6Dywy98NltA9GzKpONChjoe7e86zK/blAXc6B/HfaAogGDkaCJgn8vr9bx
	N9TN0S4MYgQ1vJxbEayep/RgEJvbjISp/PuB+gGwQBEOCRvfnKYnCIc13mNZVh2Hax84
	w/LCcE1VtDXFHN3JXlihrRC+ehkrESha5xzPWEqx5gEu8vQa+WgNeBYBvmFJIyE9KzA3
	w2ztseHSWkyAjAJ9zm3itvMbmzM/PD4e5Kjvq3S2QIDZvFZ57DToDcUTvipMfkCtKwah
	e1fZuV4uKb8ZVHnY7WhfSAwJuGTua+2GKSEZ1AZbreSnSvfmCuh+yf8btT/bz7rVaw13
	FQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=t1ilkGUT3DWfZp8wCJoPiiF9++5cxEKVLX1zA8f0UW4=;
	b=dY+Q6gcssrRuQyLDIyXQU/GwYxgrU96jbXxbJ8hiV11FApMIK5LiPBmn6J9Uep2Tbh
	EhDZpa/LEWkxee5oWiRrJdgi+xjJoxJx68Aq/TcxsGzRLofh2QL3p/FtZ0zHkjCQD0jO
	XkVDgSZtHcQLEn/riDdaYJLCynQFAvyJOZ++cctOlVom9cGS2CSzmnKkHt5IaBUHsx55
	+MPC9Bu3rPku0lxd3jPTxe2jD28g47shlK9oqMnpkL0LUoUnWLUskM0je1U78IPSf34A
	znnKz07df4SIRn5VKqSp1KKFw9bm7rxDrx5wMEDgUSJmPM173Vhkk5WlIr55iKaIohj4
	0WDg==
X-Gm-Message-State: AOUpUlEOy3puDVNZVenz6ieYjO4q3Sd3sIsVNy/GyDYcgw5MNX3596Jj
	zdHeQAzQT59U3S4PZdz0iyuz78fbCnKn6YdtPqA7HPV/
X-Google-Smtp-Source: AA+uWPysdLwTnsv+fSLZvdQvlxqt32CB2+zxCIvP70iT0WdPaeLECOLbNcAIvdMvkTHqOp5DVKwPCW2mbouzhsuWiX0=
X-Received: by 2002:aca:c351:: with SMTP id
	t78-v6mr31210078oif.338.1534454930575; 
	Thu, 16 Aug 2018 14:28:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:590c:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 14:28:49
	-0700 (PDT)
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 16 Aug 2018 23:28:49 +0200
Message-ID: <CALbNGRQXs=QAmobAa+XoKP15-EiQ806eL7Dbs-BC=CTh6r_yww@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/16] updates & minor cleanups
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
X-List-Received-Date: Thu, 16 Aug 2018 21:28:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2018 at 8:27 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> Some of them I carry along for a while. Patches were tested with glibc 2.=
28. In
> case of trouble I'll take care.
OOps: I meant they were not yet tested with glibc 2.28 - sorry

Andreas

