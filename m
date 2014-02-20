Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 251706EFEF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 17:52:27 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 20so2498869yks.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 09:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=hIHkV7EEx1PHRNxG8l7t/gY7XwiW3xtqCy+717N7HdI=;
	b=H6yHVV0uljQE36pVFyqTok4MYaAaIA7zFDwUUS9f1ABlxCaiFGdPwg4XI7ZPOWOIiJ
	C2VRRFKhVzQoHBWqmLrf+8tlE4Fs5K2ujoX/iJ5jXtLK5RoGK2d+0qwKut6DfqWRUfIc
	vucXxp7MmMQlgiNrd171463mixnpeynnDRKNh10KnSqZJc1hGESx90fjzdAMae/cjT3s
	vEKyEb756ykY/bnaLwZst1ZYXeyC5lJjYBpx1oxT63VRsMolIjxXHQXi9eGFxnSjUSKx
	KMPpgf7czEKfImMHXBG/NpWHvSXDPY62bsBE0YIZTE80lMxbU2fRXREB063QZReAfuym
	W54A==
MIME-Version: 1.0
X-Received: by 10.236.158.226 with SMTP id q62mr5262802yhk.2.1392918748003;
	Thu, 20 Feb 2014 09:52:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Thu, 20 Feb 2014 09:52:27 -0800 (PST)
In-Reply-To: <1392916331-30391-1-git-send-email-denis@denix.org>
References: <1392916331-30391-1-git-send-email-denis@denix.org>
Date: Thu, 20 Feb 2014 14:52:27 -0300
X-Google-Sender-Auth: 5u8m-yxlJj66ChiogdiYiD7I0dI
Message-ID: <CAP9ODKoav75vbvCQgx8OijAzC6Zu77vdw3wQtxCVfhNdVe1NdA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCHv2] nativesdk-qtbase: do qmake replacement in ${D} instead of ${B}
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Feb 2014 17:52:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Denys,

On Thu, Feb 20, 2014 at 2:12 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> * This way we don't mangle ${B} and can repeat do_install if necessary. And
>   previously it would require running do_compile again to restore the proper
>   state of ${B}.
> * Need to bump PR, since do_compile isn't changing, but needs to re-run to
>   re-populate qmake-real binary.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Works like a charm. I will wait until tomorrow to see if someone has
any extra feedback and push it.

Thanks for reworking the patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

