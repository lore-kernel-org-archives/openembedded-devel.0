Return-Path: <sragolu@mvista.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id E23AF65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Dec 2016 11:25:19 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t79so20553525wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Dec 2016 03:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=lu2jVuEpEYpfPtBBo2HWTFHb/oQ0/ZkWppbYHr1dnJs=;
	b=vgjBGcPcc5aaSTqBHtY372kmgjlSgFbvlbJPvwswvESkBfB8gEy72X4+TM9FUXwbjW
	ozNrL81lIRVsNKi3L9m/l2M/9elUy3DB061x/o2v/kjAl3cdnMbh7f8J5jZGU/SfqYtc
	nEktnNKy8D+R/AB1h8Jp9T1cupoqu1S6uPlfEggbLiXNUzCAT6jhEff+EumxcJ0nn0PN
	DvBTtG3CtcOgZ+SLjq0SS8xFWZphHNPDL5t+a3Z9tYB+2asQXAuMs7rg90UMm/kLzm8q
	QQXfdlu8k6Du4F6FXm1fbdOAiZkkOzLyyMAVWRnen6XFiCHFX4rD5hw5v/k273p8/Itn
	sjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=lu2jVuEpEYpfPtBBo2HWTFHb/oQ0/ZkWppbYHr1dnJs=;
	b=RUI7VxKHK5Pj6G+D/hqRFp/mnAgfnTWYAkOh/8FuCH1tvwanOazpbzktWatK/2uLyI
	kxrXNf4eiJ3OqUAAcup8rvTNQi12VOO+xk/n7NT42yUII53SljrZlUXE0wq/P9mGD425
	PwzHpMxfwbQr4DreAnlJTfbILohOl3jjjeavvEtLNlUWi4K5ysHn4sky6suRSxxv7fJk
	DQUcjTdZYRrxo6KI1Y0aX4BQZd1NqIDJbPRM+gXs5PLZ+1dhufiJT4YiXOt7zMbLThmd
	4kxJbEZzHrn9KlqV71mTfzsCdqpHyY5kPqX/cTsC+30qM8fjmdLoPVdtOtuxDxqfCaRi
	1RKQ==
X-Gm-Message-State: AKaTC01k0RbkmMIUyiNLh0j/fhICygc8uR1aDjUeJN/4eYE4m+nUUTtVU1ilcxL4I9dNP3wi/yd/tNFFb3PBfTtg
X-Received: by 10.25.104.2 with SMTP id d2mr20765729lfc.95.1481196320298; Thu,
	08 Dec 2016 03:25:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.158.144 with HTTP; Thu, 8 Dec 2016 03:25:19 -0800 (PST)
From: Srinivasa Rao Ragolu <sragolu@mvista.com>
Date: Thu, 8 Dec 2016 16:55:19 +0530
Message-ID: <CAH4+OFpuPOdJsiEGXO=QX58qq_y_85c5SFHQZ2WM7VE0wo+HXw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: OpenJDK-8-jre: javadoc: error - java.lang.OutOfMemoryError
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
X-List-Received-Date: Thu, 08 Dec 2016 11:25:21 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

I am trying to build openjdk-8-jre for arm using yocto meta-java layer. I
have been facing do_compile error for openjdk-8-jre as shown below.

Can somebody help me to resolve this issue...

*| javadoc: error - java.lang.OutOfMemoryError: Please increase memory.*
*| For example, on the JDK Classic or HotSpot VMs, add the option -J-Xmx*
*| such as -J-Xmx32m.*
*| 1 error*


Please help me in resolving this issue .

THanks,
Srinivas.

