Return-Path: <frederico@cadete.eu>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 55CC673929
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 13:50:31 +0000 (UTC)
Received: by padfa1 with SMTP id fa1so66708004pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2015 06:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=7HF5nY1pK3nnLAAdsX2U8uoHO98Ea+mZCsM9kT9oBss=;
	b=KaU7zislqlnvmzcp709x6BQfVqzh7rue89jfzGWMtSkTMYwhFKEsfJqXiL3Hz1c+2M
	Qzc/I30+1Uc/g1mD+iie5KDY4aWZLxaTVcaqHz8D43L5KjwQg7Dqw+QsoQwDXmcIjccP
	PIXFHgb+SW4U1DpuIWN75Gxj4BVMlEdspM76OGWdmthVqyxkFIh1GWDIecqmniyfLh6p
	PndcpCswa862vODbUEMtP5l7GupldbQnJQNbTVNngcB5zpDUsVocuqwZGdAoNXDPtTiA
	f3UfuppqYiVIitSm5rBayOclCdk4R8LkmfFobTb/Y+ErawIrqmKcm1GUOb4yQ+Ya4Kiy
	z4Hw==
X-Gm-Message-State: ALoCoQkBYIvXmeq4gko41otzKm0dsBlh8L69786X6UkioiHNZPWG6YybeGdtoct+GF23TLuKHC3r
X-Received: by 10.66.221.194 with SMTP id qg2mr54198397pac.106.1425909033341; 
	Mon, 09 Mar 2015 06:50:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.139.198 with HTTP; Mon, 9 Mar 2015 06:50:13 -0700 (PDT)
X-Originating-IP: [212.166.56.147]
In-Reply-To: <5940D1D9F240BA44AEF939055CF1358D05983328@xmb-aln-x12.cisco.com>
References: <CAL5ScNULNnnK5NyZ9SN2q2fidHpDW8XR6DL_kkMujgTXDCogFw@mail.gmail.com>
	<CAP9ODKqqy9xU3NW=0LDzsVDokA5xiCnH49kY2Kw_wVSL9U1bQA@mail.gmail.com>
	<5940D1D9F240BA44AEF939055CF1358D05983328@xmb-aln-x12.cisco.com>
From: Frederico Cadete <frederico@cadete.eu>
Date: Mon, 9 Mar 2015 14:50:13 +0100
Message-ID: <CAL5ScNUOLrvKqKerezbgBrNmgHuvQr-b6ZrARU9wHqBa+43NiQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qt5-git, qtbase, qt5everywheredemo: use https protocol for gitorious
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
X-List-Received-Date: Mon, 09 Mar 2015 13:50:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 9, 2015 at 2:01 PM, Julien Brianceau (jbriance)
<jbriance@cisco.com> wrote:
> Wouldn't be better to move to http://code.qt.io/ ? This is the new place where Qt repositories are hosted, and it supports git:// protocol.
>
> Julien
>

That sounds good and is working on my side.

The remaining question is qt5everywheredemo. It has
 HOMEPAGE = "https://qt.gitorious.org/qt-labs"

This will have to change soon, but I don't know to where.

Sorry for the "invisible" patch, the mailing list blocked it while I
was not a subscriber.
I will follow up with a PR.

