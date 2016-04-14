Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2FF65C5C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 14:31:26 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id ot11so45451387pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 07:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=t5VJVfgx9jySPI/dPUM6tRULitAbZhfNZaLmdf5NFLA=;
	b=nMAC9oRP7nVXaeaP5e2GU59kAf6hZg3Rx7Dfa8iWoFiZVD8uyH3xRwDRRG3Id60xzB
	tCkU2T15iWFc7cpZNu4q8bx72JUEmYsVN0lejTCXTdE5lw//SUxo4od8Xrkmu9nz6NXi
	xqcA1s0vrya7wEcGkHYNaqgCITXWCE05m5YE2Z1GaYruWSxlh/qcruhpTQ05uHVafzos
	z5dPIm2NiGYQ79pr8RAK/JxRXAxHyTBrcQvrPp0FME454TXZtZTuNYnyDjTKAWxxdJjV
	db9nJXai74JqlpC+cVEcH+34vyTNETVE5qQ+Ll73BK+evzlZx0gGBkA40YPbH6wXfRoI
	lQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=t5VJVfgx9jySPI/dPUM6tRULitAbZhfNZaLmdf5NFLA=;
	b=LEo8BXJsDSYQe57tU2Pk58LdHZE/fdDLsCZOpRQKi+ERO4oaicKbdEe3+4DzTlEBBx
	sVq91+g5uPAn37qpjztK6yGQvpicgbwC0z414AYD6+y2EJqJtJmmMqz991b1yECmolzU
	IZP4heKiDpSaIrdHRqz3hAEszhxwu9UIRyz2fKy+JdDOzRKGe9J7KXJ1A10AOX5IvU8T
	TPSFGnbF+gvDGujnKk/TeeKPHo2HGeO4eyNRuovuM1DWd663zS+R0lIETg8cN8xSDcql
	y7i87smd5hZvloEWEd+SmpwyiDZ/rZLjwGsDaXOrpWsLsnsVBW9MiEAchmuxxFbGx7BU
	8ETQ==
X-Gm-Message-State: AOPr4FVQhFbHTgSRpQJXev+f3n3sR0icXMGku8CHtbHCMKKMKUWCZxBzXwzppBE4e937gA==
X-Received: by 10.66.146.196 with SMTP id te4mr21610619pab.125.1460644287009; 
	Thu, 14 Apr 2016 07:31:27 -0700 (PDT)
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com.
	[209.85.192.169]) by smtp.gmail.com with ESMTPSA id
	136sm15516295pfz.44.2016.04.14.07.31.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Apr 2016 07:31:25 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f169.google.com with SMTP id 184so46745842pff.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 07:31:25 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.67.139 with SMTP id l11mr21570315pfi.112.1460644285056;
	Thu, 14 Apr 2016 07:31:25 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Thu, 14 Apr 2016 07:31:24 -0700 (PDT)
In-Reply-To: <1460638043-29679-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1460638043-29679-1-git-send-email-fabio.berton@ossystems.com.br>
Date: Thu, 14 Apr 2016 11:31:24 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrG8mUby6rFbtH50uERdm5a5yeHtgnz37edABt0Kf+FpA@mail.gmail.com>
Message-ID: <CAP9ODKrG8mUby6rFbtH50uERdm5a5yeHtgnz37edABt0Kf+FpA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] lldpd: Update to version 0.9.2
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
X-List-Received-Date: Thu, 14 Apr 2016 14:31:27 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 14, 2016 at 9:47 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> This new release has following changes since version 0.9.0:
>
> lldpd (0.9.2)
>
>     - Ability to add/remove/replace custom TLV from lldpcli.
>     - LLDP-MED capabilities are displayed differently in lldpcli.
>     - Limit the maximum depth (5) when trying to apply a VLAN.
>     - Change JSON output format when using json-c to match Jansson
>     - output.
>     - Integration tests for the major parts of lldpd, including use of
>     - address and leak sanitizer.

       I think the extra - is wrong. It is a continuation of previous line.

>     - Fix:
>     - LLDP-MED POE TLV are now displayed in lldpcli.
>     - Ignore lower link when it is in another namespace.
>     - Fix various problems with interfaces being enslaved.
>     - Fix a memory leak when modifying port-related settings.
>
> lldpd (0.9.1)
>
>     - Rework packaging for OS X to make it work with El Capitan. To
>     - simplify a bit, it is not possible anymore to build fat
>     - binaries. Latest version of OS X supporting 32bit was 10.6.

        Here too.

>     - Fix:
>     - By default, when using port alias as description, use port name
>     - as port ID.

      And here.

>     - Miscellaneous fixes with netlink cache.
>     - Ensure large netlink messages can be received.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Please rework the commit log and post a new patchset revision.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

