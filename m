Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1RznOO-0004vR-1l
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 11:56:20 +0100
Received: by iaby12 with SMTP id y12so9439330iab.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 02:48:00 -0800 (PST)
Received-SPF: pass (google.com: domain of giuseppe.condorelli@gmail.com
	designates 10.50.95.166 as permitted sender)
	client-ip=10.50.95.166; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	giuseppe.condorelli@gmail.com designates 10.50.95.166 as
	permitted sender) smtp.mail=giuseppe.condorelli@gmail.com;
	dkim=pass header.i=giuseppe.condorelli@gmail.com
Received: from mr.google.com ([10.50.95.166])
	by 10.50.95.166 with SMTP id dl6mr18458698igb.27.1329821280573
	(num_hops = 1); Tue, 21 Feb 2012 02:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=SiYYM6zg8o22TP7vO58tC/V8GK6Q1so8k7ycco0TUm4=;
	b=liKgPUE5KNp5pdIRKMyE1lFxKq3S3HncIt1Tn7IYUxV3Md2/G3xPsmjixa2Gc+iqBp
	RF5isFJD6mEPQVkKDQLtorSffEYH7OlSQNPtHQaAraRKA+q+rweyIafmA9XuIugWF9rG
	mSOYrxoZMxd052xQegWaygt/c/UfR/PPTC/4Y=
MIME-Version: 1.0
Received: by 10.50.95.166 with SMTP id dl6mr14901515igb.27.1329821280539; Tue,
	21 Feb 2012 02:48:00 -0800 (PST)
Received: by 10.231.183.67 with HTTP; Tue, 21 Feb 2012 02:48:00 -0800 (PST)
Date: Tue, 21 Feb 2012 11:48:00 +0100
Message-ID: <CAOHjBZvHtGh1v0LSUkDA=o9F0cHxD1TZ8CtrOQdzeXy8yZk-Dg@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: CONFIG_SITE usage
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Feb 2012 10:56:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,
I'm in trouble trying to set CONFIG_SITE to allow my build process to load
cache from a given file. I've understood CONFIG_SITE can be set from .bb
file, but I'm wondering if it could be set on local.conf or distro/machine
conf file to be inherited by all packages.

Please let me know.
Cheers,
Giuseppe

