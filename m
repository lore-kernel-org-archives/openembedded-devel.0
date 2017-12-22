Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id DE11E788E6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 12:32:13 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id h9so25032024oti.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 04:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=AtLMLel7kI9weOjFSZPw5tta0Oqp8c9XdHEDH5W8A+s=;
	b=CAJITpkJvp2xQUY4X2yA5EYc+/MLp+kdItfsK1zb5I0f3QvBpzPmWw0faboMDsRkox
	ZMykar5SAAltvnC+ONIYEEduHzzTEoRGaVR7R8a/rCVOtEtjzNLfqtRSno8IyDVIldN/
	a/FdM3+VhksvI4NGe5sXz17SCS1xWrJEppuT6JXhvIX33mwJWRI2VfodAVJv+4OhXlxN
	/dipw0hfVbZfPZ3sIA8gG3F3gXixceDFOfygJZ26s2WKwWI2PHU4fZ5vXnByndDOmdNC
	/49qtQFrqJq6LkB5Zok9Tb6LvOH6bg03iPs/q9yvudVEr5d8bKZt4SDo1/JtT/I2KnYi
	fDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=AtLMLel7kI9weOjFSZPw5tta0Oqp8c9XdHEDH5W8A+s=;
	b=pnQIPrBqX2pN3JY0iKzu2TWpjNkl5uNGd3i4KP6kr2XvBUsrgiZJI+HRw1X+SuTpVm
	+ENF/eYdHcAXJ9twAfSms5pSvjQakpS4Djoyb2hfsTU5lJVaqz3tcEeZ51QaVkHwzM8H
	BoCJUPG9mERNYb7Ci1TKe6Eyc3zf9G3ghuBEQoXFKcp7jnJKELvemtdmaHkDLAvWoiZu
	gYCr6ORv+cEsVOiDYR81zB/dGfPk6zXEE8QQZtGUBuhhd2HAHVYJmv4MlluKqcKFNAHP
	oOb5YLC3kQmhapXO4OYjWAq6Be03+BobplwytNxga/AK7NE7m0M8DkSV/u+A1IxlUXio
	pmCg==
X-Gm-Message-State: AKGB3mKZbiz2L5ts/C5eZq1JArt2tvrCXWBMNz5UnPGCRmcbGvDhwzZh
	8Ef7mNbz+vdBSQobx1Lz/vqghCBW
X-Google-Smtp-Source: ACJfBosgZPdN0z9pIezhy9o2y2RXwEjn+E5WvZGrQKvNIghkVFz7S6dkLq2lge1mTaGIuQhjhmDPqA==
X-Received: by 10.157.4.231 with SMTP id 94mr11634336otm.141.1513945934723;
	Fri, 22 Dec 2017 04:32:14 -0800 (PST)
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com.
	[74.125.82.180])
	by smtp.gmail.com with ESMTPSA id 68sm9987262oik.1.2017.12.22.04.32.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Dec 2017 04:32:12 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f180.google.com with SMTP id q39so18583958otb.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 04:32:12 -0800 (PST)
X-Received: by 10.157.14.215 with SMTP id 81mr11465898otj.284.1513945932098;
	Fri, 22 Dec 2017 04:32:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.41.233 with HTTP; Fri, 22 Dec 2017 04:32:11 -0800 (PST)
In-Reply-To: <1512996791-31471-1-git-send-email-guy.shapiro@mobi-wize.com>
References: <1512996791-31471-1-git-send-email-guy.shapiro@mobi-wize.com>
Date: Fri, 22 Dec 2017 10:32:11 -0200
X-Gmail-Original-Message-ID: <CAP9ODKruozGHrY9Jo2-kG+0E7uqZP-UZGURGGN-N1SQSCTa4CA@mail.gmail.com>
Message-ID: <CAP9ODKruozGHrY9Jo2-kG+0E7uqZP-UZGURGGN-N1SQSCTa4CA@mail.gmail.com>
To: Guy Shapiro <guy.shapiro@mobi-wize.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Srinivasa Rao Ragolu <sragolu@mvista.com>, Ming Liu <liu.ming50@gmail.com>
Subject: Re: [meta-java][PATCH v2] openjdk-8: recipe for jdk8u121-b13-aarch32
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
X-List-Received-Date: Fri, 22 Dec 2017 12:32:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 11, 2017 at 10:53 AM, Guy Shapiro <guy.shapiro@mobi-wize.com> wrote:
> Main changes:
> - Fetch the code from the aarch32-port repository. This repository
>   contains the C1 (Client) JIT, making it much faster than the
>   currently used version.
> - Compile using the newly available Client JVM variant.
> - Don't apply some old patches that prevents the code from being
>   compiled.
> - Do not install modified jvm.cfg. Keep the built one instead.
>
> Main issues:
> - The license file change (address update) breaks the build of old
>   versions.
> - This patch was only tested on arm platform. It might break other
>   platforms.
>
> Signed-off-by: Guy Shapiro <guy.shapiro@mobi-wize.com>

Thanks for looking at this, please:

 - remove old versions of openjdk-8 when doing the upgrade
 - please do a minimal test in other platforms so we can get it merged


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

