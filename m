Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 675126E268
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 08:08:36 +0000 (UTC)
Received: by wmec201 with SMTP id c201so13692689wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 00:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=PfHN1romM0184R9YavqHydE1/xNtI2JVs1u8VaOKyGI=;
	b=QtcotlcZc6ZNaPwfr2LpUq3mZDmfr7Di1HcMeHvVQDLZE5RaMkAQ2rp7xC9b92/AJ/
	mChsh6Io3CrB6VCo/bbUQi+M4JnJRJ27yf5cdulk1Ynk88v1AOzn6PqHlTW+Ug4dwoDH
	YtCQpr3VLubfVPoO5Be1hEGbUIJeiJ2N9fhbsGTxykjfpE9QqARwqOc6IztK6fQfPjoS
	ghIQkNQd0aFIrtNk42TsJpDDp7tUoo8UKf1HwpYCBxIxq1uuauOYyRAZ/3hUYXR6D0HF
	DP5ZrflOZJ0Qj9Jw1Atzir2ByuSs7Gj1dNGRC90aCga1qTtGP1ktjmGSsj0k3Iz2VXc4
	E/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=PfHN1romM0184R9YavqHydE1/xNtI2JVs1u8VaOKyGI=;
	b=eWl9xkR4Zy9WZnoTJ8JfG0vpG8ov7O6YtMlRRGIOU6EAIUOgninMXS0B7peNujY7dI
	+95np1p9Avf1AR5jq8cemWZwyz2EVRczsuKn1KelL5fiWFp/eQrcQ3Pi7yR+IzKskf8o
	xQuMstzdqOCoKPMYD4QXxV3zPuFin3/Ad8X9A7pJmwaWztHWLzKZ5Vj3GLJd4j60HNP1
	+pgOD07cvLuSnFigOS7eKDI1ZlNGONJJ7Px3k6uRKvKGTk3fpsFKhyLUf7s0gp9u5y5m
	KXdWvhN8vBT7/iDM/aVJampd6+ZBr5O6iMDAi7IcGdhzMXArLlqkvkWPry2xeYlY+qtc
	lBtw==
X-Gm-Message-State: ALoCoQkI8L2LO1DuKkD41DJUhvb0y1afTxuloAeVvJYhFniPFVh9mgojb20q5Z22uQwA/D2OoV1D
X-Received: by 10.28.132.13 with SMTP id g13mr922491wmd.35.1447747715953;
	Tue, 17 Nov 2015 00:08:35 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	s189sm22610707wmf.16.2015.11.17.00.08.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 00:08:35 -0800 (PST)
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Kang Kai <kai.kang@windriver.com>, Martin Jansa <Martin.Jansa@gmail.com>,
	Chen Qi <Qi.Chen@windriver.com>, Ross Burton <ross.burton@intel.com>,
	Armin Kuster <akuster808@gmail.com>
References: <5649BDDE.6030107@dresearch-fe.de>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <564AE081.30004@dresearch-fe.de>
Date: Tue, 17 Nov 2015 09:08:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5649BDDE.6030107@dresearch-fe.de>
Subject: Re: rsyslog: buggy systemd/ua handling?
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
X-List-Received-Date: Tue, 17 Nov 2015 08:08:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 16.11.2015 12:28, Steffen Sledz wrote:
> I'm not sure but i believe there's a bug in the systemd/ua-handling in meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb.
> 
> In my opinion this code
> 
>     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
>         pn = d.getVar('PN', True)
>         d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service')
>         d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
>         d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/rsyslog.service' % (d.getVar('systemd_unitdir', True)))
> 
> registers the systemd service file under the (ua-)name "syslog-service". So it should not be
> 
>   SYSTEMD_SERVICE_${PN} = "${BPN}.service"
> 
> but
> 
>   SYSTEMD_SERVICE_${PN} = "syslog.service"
> 
> Right?

Hi experts! Is my assumption correct? If yes i would prepare patches for master, fido and jethro.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

