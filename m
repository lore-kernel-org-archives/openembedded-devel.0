Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 58A16785DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:11:44 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id n74so7971189ota.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Nov 2017 04:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=hCk3TP+PbrtP5UX9k+NZEsbXGkBaCC6x6+O9p+hs0Sc=;
	b=p53aonSUS7lsV/FaH42P7JeL8rWmRP+nJq1WMOeZm1RK3QKzidfVuBDTDZZZ8CT1bc
	bw06xdo+zfVEomGQgRA1J0Y/uNoMucSzzH2Vm0FIcJLeGt0EK1MKb9Z8eYhTgcg+OGeF
	/CQY9d0f7vRSDOu688HnzBHBjk4bibYMqk7SiPerMkr0KxmCbxqLgSVscQM/RlQ4MfYr
	nMZ/q5e4NHA3y1V2MEUpZ7K0EYIzyFo6FcT6fu6PMOW/of3ewiiaz+XbfDBm0Ynbw40X
	8i5p6qxYI8DdwovAfRAnymXO3wvTa/JCYncZO2UXAjOOimePVTLSBa0AMYT04AHFYj52
	XHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=hCk3TP+PbrtP5UX9k+NZEsbXGkBaCC6x6+O9p+hs0Sc=;
	b=bAaRXP+MtD1gUYsYxUrBLEqysILAWY+sgiSQ3O5ihVn2CMGAhfIGUWS03RRWAyxEby
	6nYiBM9VnlRN/0FfMRfywPtLGkZ3X2om5XlBPrIB4pJ4GqcXRpqVvm+3OPhEjGQmTh7z
	DYF3mXfW7BThHGcGdCj7xulf8YS420RFg6gXvo+5MIjV3Jn9yDBnXY6dlWpobNn0haBg
	ct6cQag6eF+N2Y3l4NBe6FYRAyoYOzlfprr5G+hLUIZxpSr7vu30O0ECJYPvZK4a/QVR
	dsSsvyVEgEw0naqXbcaNcBuERQndalJs5MQsp59a9GN+Q7TkWt3NMNV3GjtI5WYyFvC1
	MArw==
X-Gm-Message-State: AJaThX6Ewsl9Ob78DPNCvyc11u95OsDbfSPbG+iPwHkMt8erX2m/RSlr
	Dt9+sGAzHRGSvYKD3UkoUSyHM/uq
X-Google-Smtp-Source: AGs4zMapSiAGi9YoHqsMtXuhNeW2FFQY+cnBGNJnWnyjiTeZw9ouoq5Rc4Yebxii0a456tLdpW/+EA==
X-Received: by 10.157.60.52 with SMTP id q49mr84375otc.407.1510315905202;
	Fri, 10 Nov 2017 04:11:45 -0800 (PST)
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com.
	[74.125.82.177]) by smtp.gmail.com with ESMTPSA id
	g33sm4224187oth.51.2017.11.10.04.11.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Nov 2017 04:11:44 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f177.google.com with SMTP id n19so7609448ote.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Nov 2017 04:11:43 -0800 (PST)
X-Received: by 10.157.66.34 with SMTP id q34mr89863ote.357.1510315903451; Fri,
	10 Nov 2017 04:11:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.12.2 with HTTP; Fri, 10 Nov 2017 04:11:42 -0800 (PST)
In-Reply-To: <1510297879-771-1-git-send-email-samuli.piippo@qt.io>
References: <1510297879-771-1-git-send-email-samuli.piippo@qt.io>
Date: Fri, 10 Nov 2017 10:11:42 -0200
X-Gmail-Original-Message-ID: <CAP9ODKq5+aW97JP=xJpVQ7mL2FrLnyQnGfw3yAkRH6J4hbhycA@mail.gmail.com>
Message-ID: <CAP9ODKq5+aW97JP=xJpVQ7mL2FrLnyQnGfw3yAkRH6J4hbhycA@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@qt.io>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] gstreamer1.0-plugins-bad: add expansion parameter
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
X-List-Received-Date: Fri, 10 Nov 2017 12:11:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 10, 2017 at 5:11 AM, Samuli Piippo <samuli.piippo@qt.io> wrote:
> The expansion is now again optional, but for brief time
> it was required. Add the default value (True) so that
> the layer can be used also with older oe-core versions.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>

Nack! We shouldn't keep carrying the old code support.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

