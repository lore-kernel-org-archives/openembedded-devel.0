Return-Path: <dachaac@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id D1094606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 17:34:00 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id f93so2421679lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 10:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=FNUbODcykk+xDtrdcfnXiIqHDovWmkY1Bcnn34k+ehA=;
	b=U7v9aJiQUT4IuvaiMVsgRZaUroTOBKeBjZ9XAqj2+sb+GrE6rKHM1rrE31WXfW2/6q
	wDYQI2HICTHrn9JzDLSud/QWk2t0DWS3L21sI9wkX4Obbx8wJq/Q+rRwUMCWx82yfN8b
	8fiQ6+WL04dCbfxpUgReGo39KrV8mlJLRraEfJNsG9No47rKMSxO6u93BMtCT+1d1BEt
	LR7gLDxUqSj54ul5DVb2NBCJm0IjSjGKh+Uy7AdYbYJluPb/UKfYji0bZsV43vlhUj8i
	QisEeX6Cs9ONqZKVEqSvrA3OhiwmZM/k59Sr3iAtJQMzWnkZi8oEYO9l11ah9igaosiO
	jzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=FNUbODcykk+xDtrdcfnXiIqHDovWmkY1Bcnn34k+ehA=;
	b=SoeojU22GPed5tnCvGSfoRlmWWb1XJBzLgq5qdkkVrCTdb2llfCbWKdZBHkhJ1xC4W
	CXsMC80zc4neOQAFHL2PKYoHxnH1isnJDD62zojfSabP5C92uA3W+ntQ06rNK53c1RDN
	x2nTATGraWE3MUHNhkVrUlcx8etNQ0LbvX7dickmSweQD1WC6CwCapwi8JLme6GF2sKv
	p7Lhv7QQgF22H+2AoCt7xBERLm37BgrCEPCNo7tGrjLUgjYLd2V88BOywe9nMmCaJh5V
	07QH8pOxgix5R/ToCcdF86bI1H+lo62I1f5o+Zp14D0NP21/KPzysw+tyE8tfopAwQJO
	T87A==
X-Gm-Message-State: AEkoousfhvnq9PJ5iw29ABSzr4HqX0ESmicbvmVXmV29yWio99nXM90IQBOYP9tYv1zpXg==
X-Received: by 10.46.5.196 with SMTP id 187mr11712504ljf.13.1469640839903;
	Wed, 27 Jul 2016 10:33:59 -0700 (PDT)
Received: from ?IPv6:2001:14ba:8022:a700:7504:8c52:fa3a:8c94?
	(dtyvmryd1ywhgg0v6vwmy-3.rev.dnainternet.fi.
	[2001:14ba:8022:a700:7504:8c52:fa3a:8c94])
	by smtp.googlemail.com with ESMTPSA id
	q73sm1147931lfg.17.2016.07.27.10.33.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jul 2016 10:33:58 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20160727154953.13918-1-Martin.Jansa@gmail.com>
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Message-ID: <3f91bfa8-d87d-9e79-c38d-e4b10a74c1ae@gmail.com>
Date: Wed, 27 Jul 2016 20:33:58 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160727154953.13918-1-Martin.Jansa@gmail.com>
Subject: Re: [meta-qt5][WIP][PATCH] qt5: upgrade to latest revisions in 5.7 branch
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
X-List-Received-Date: Wed, 27 Jul 2016 17:34:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

...snip...

I did not see the license change from GPLv2/LGPLv2.1 -> GPLv3/LGPLv3. 
Was this some previous change or just forgotten one? With quick look I 
did not spot GPLv3 mentions in meta-qt5 in github.

Because of this dramatic license change I would recommend keeping old 
5.6 available so if one blacklists GPLv3 & LGPLv3 then old one gets 
picked up.

I suppose right way to handle this special licensing case is to define 
license as being by default GPLv3 | LGPLv3 and then if company purchases 
license for Qt5.7 then override recipes license with something like 
LICENSE_pn_qt5 = "commercial" in local.conf or own layer with matching 
.bbappend?

Another related question is that what is recommended method to select 
license? As some software is under multiple licenses and then we would 
select one of those licenses and then only want that license to be 
collected for image.

I suppose this would need similar method as what PACKAGECONFIG[...] but 
with LIC_FILES_CHKSUM[foo] and then you select one with LICENSE="foo"?

Thanks,
Vesa Jääskeläinen

