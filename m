Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id CE94965C8F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 21:32:15 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id g8so3024201pgq.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=C/ptrarG3t4jBbGm9Ld7f9dEDw4prCGYwaGewK5Lme4=;
	b=CCUNAtwikg6aeUiK1tAMhzwZQTodniCeWcxjO2iWARRwtIhNziYKw93jgAuwVbXc5h
	MErrA/ZhF7eNx4zHQrd/mb01+nmnzea5iwTPyLzUiou/qbO0T4gAWpZYGOCLbnn4YZ3A
	9cAVjEnTFCU/nHKY1QdbvJGj6hyTofttLjcJqtgWFNDscUVU+MBfaGeJfjAuspHDd0cW
	3ZB5DBYNS9/UIKGI8bsZr4PKHCy/UgRRu4Ily+WeQQMWgemh3EBFGE3sXTnICcISylLB
	QDpMdSOcGroeieJvE4wnGSK4aYb5fVmu5sf3wbGBMYQ1fj7jzpqiZqsNtaL20vHnmSzM
	tLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=C/ptrarG3t4jBbGm9Ld7f9dEDw4prCGYwaGewK5Lme4=;
	b=T9HDz4jKu48EsceY2tJmGKKk3vqrfFIMQhNjweu4ZAwThNCYZ5j8bGCaiFSXman8Rv
	kCAklgPYwVV5zPb1jIEiKZXMsAYggWN3cjVX7h4cVsnitljAFlIp/FFciFAygc/rtHHA
	U0cNG0SMQICCtRCVSw6X6i1Q6oXRBm2y+viSMoXHIgv+SOSSuBEcn7tet7UJ6TCZH9C1
	i2rhErB01FKWkB8cmrPWQDHpDDf5H+ECRdmjy2noj2ktl25vG1WO4Tc0bRtpErrZQuwv
	HGboeNKzm9Hlbj8UZrJSu3UO7Jqd9042hhkBwcIgnyE41AP+KD4MRiA/Ow6Akd4XZbAL
	BQfw==
X-Gm-Message-State: AElRT7GBWAJ2q7hGCXBuFzJAU23A8ULKMPsGfrRS4FjMf7906+WyaWbg
	siHmGqklAUWkWa+UWSsPYAVh3Q==
X-Google-Smtp-Source: AG47ELsmUiD5CPnRmrvfv7cdocIN1f7ItYjbqX0HVU/TmdxXlVkJJsOCplbqubVKkZO6HFVxmuD91A==
X-Received: by 10.99.182.73 with SMTP id v9mr7232730pgt.158.1521408736836;
	Sun, 18 Mar 2018 14:32:16 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:4088:e426:a566:fc98?
	([2601:202:4000:1184:4088:e426:a566:fc98])
	by smtp.gmail.com with ESMTPSA id
	188sm18947027pfe.93.2018.03.18.14.32.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 14:32:16 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
Date: Sun, 18 Mar 2018 14:32:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: meta-openembedded Layers
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
X-List-Received-Date: Sun, 18 Mar 2018 21:32:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello all,

I have been reviewing the meta-openembedded sub-layers and I plan on
taking the following actions:

Please keep your comments focused on the 3 items below.


1) I plan on resetting the sub-layer maintainers. Several maintainers
listed have been inactive.=C2=A0

If a currently listed maintainer is interested in continuing, please
send me an email.=C2=A0 I plan on removing in-active maintainers in 12 da=
ys (
March 30th).


2) I plan removing meta-filesystem and moving recipes to other layers.


3)=C2=A0 Meta-gnome, I have heard feed back regarding this layer. Does it=

make sense to remove it and push needed recipes out to=C2=A0 other layers=
? =C2=A0=C2=A0


I want to get any restructuring done prior to sumo release to lessen
impact on the Sumo maintainer.


regards,

Armin



