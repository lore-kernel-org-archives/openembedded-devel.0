Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id A349678741
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 11:19:36 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id t35so9831791otd.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 03:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to;
	bh=vzn9yJ1fYZzF7Iuo8tWEaPFzKQkzZ0Pka1hqSVSapek=;
	b=to/W/KWKpAMzB250F/ysVfa5npCqzQx5qWb7jR6UQ8ZjaPPeJwe0nhepbQMqcDE9Qi
	eIwyb0a5+YXB2gmdkEoXZx7el1HBbdZu2It6FlHCgpDz4U3avSSgm3oo+i9/zZZF2WX1
	7YllAzwcCoQ8VGa8CwN3sPnMJin7Sg+AXd503WR60uWy2l6T1xh+pBbIndhekE5KUdO3
	O1nqsAUXxnJ8weboFsVsfWT0epDrkYMZzzt8iDWlfamBn0mZCmF6wXCP9rjPIjOk0vVc
	h3/Ay5t1HNbKzjLrC41kHOeNPrVznQje82zIjPXtokfuIIuqWMWNGT53XXUDxZxU4gTK
	VrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
	bh=vzn9yJ1fYZzF7Iuo8tWEaPFzKQkzZ0Pka1hqSVSapek=;
	b=tPl096D3vaJJffA02urpl3FgD90UUJApOmAq54pWg5LVo3evnBdiqFYdI0QRJ+8Aws
	pEoXU/kNyq4iIgdRR+BXFhLlkGF22y+Xf7lT76wp1tC2z9PfkgMxJMhRXIWZsRYLpTZC
	MN9IsuRIytB4uvKeYYAvlSd8NGF9pV8LJ+Y4IRjsSnaeQkv9i2mXzhzzKXlQ4rE4JVy0
	HpXeSYiibeMdwJ0pydlscj0OHusdS/s4gF6iA1UUUcLvCfSFZaqbeefHiN/f/mFwg/jn
	misxuyMwDAz6YfhwFmxZ0rivfoemdvwgZSaK+2T5HQDq4R67xPAb7ZSIHVKcmlLoNc3a
	R4wg==
X-Gm-Message-State: AKwxytfz8a8E9fplD8TUOEQyKAN/Z2KpcdaJGTbqYE/2ZPb+njBQbaY6
	Wakp2ecjY7uZ3Q4iUYNLHsih6AVa
X-Google-Smtp-Source: ACJfBovoaIKm34PEcmqX4KaR47stkU7CvVRcQOxFLEjpIDMk0gRpMMJDiQl2OZaS3Vp7FMg8yxn2lg==
X-Received: by 10.157.12.37 with SMTP id 34mr983532otr.84.1516187977578;
	Wed, 17 Jan 2018 03:19:37 -0800 (PST)
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com.
	[74.125.82.169]) by smtp.gmail.com with ESMTPSA id
	q12sm2006088oti.48.2018.01.17.03.19.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 03:19:36 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f169.google.com with SMTP id s3so16487164otc.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 03:19:36 -0800 (PST)
X-Received: by 10.157.37.8 with SMTP id k8mr928883otb.392.1516187975718; Wed,
	17 Jan 2018 03:19:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Wed, 17 Jan 2018 03:19:35 -0800 (PST)
Date: Wed, 17 Jan 2018 09:19:35 -0200
X-Gmail-Original-Message-ID: <CAP9ODKryMRC89jUui6wtsZii8Q_WHhGhrtRT=so019oHzLUjLA@mail.gmail.com>
Message-ID: <CAP9ODKryMRC89jUui6wtsZii8Q_WHhGhrtRT=so019oHzLUjLA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: qtbase failing due host contamination
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
X-List-Received-Date: Wed, 17 Jan 2018 11:19:36 -0000
Content-Type: text/plain; charset="UTF-8"

Hello folks,

Did someone see:

ERROR: qtbase-5.9.3+gitAUTOINC+4d8ae444c2-r0 do_package_qa: QA Issue:
qtbase: /qtbase-staticdev/usr/lib/libQt5PlatformCompositorSupport.a is
owned by uid 1001, which is the same as the user running bitbake. This
may be due to host contamination [host-user-contaminated]

In any builds?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

