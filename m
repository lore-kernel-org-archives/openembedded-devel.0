Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1FA787AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 18:28:06 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b189so1984013wmd.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=bO9cysob6WuVH6IQbwL+uhslY9s/ufhetla75Wg7dvY=;
	b=xLh2L3j1fVFPU/ZOWklEHCuVXDd3SVRa10ZGSY1DDusZkw/83+EzmRnVIddKBg+RyM
	M35uZ1JkaQ4nzqPaOQGY8VnHdFMVSYAHSxu8G6k6ecBFuZP5aP1/Ce+Jw5XoPVLfgY6m
	61BrzqKfmgjYt3Y8GEx2QCJTuF+AuS25eQ6tGnUXeFJSZy4PyS1t/9AQyMLWz4aem48d
	q/HN+5cBqCzYXG3GeFkyUO63WQY8zu33sDFfXG4kokoM/lrk4JCD6C6D+lEZ4/eVdD3g
	8T/4uAyhvrmwQuSYLlh7aUbBctJ2VC2S7uhcX3o3wrub+mj2M5cWWTI0vYi3dHJxbhSe
	t/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=bO9cysob6WuVH6IQbwL+uhslY9s/ufhetla75Wg7dvY=;
	b=Nvw2KUAmNvr2m+muMyHFwFPvVCtCuBHbGDpjo6BgIiQuOoUn52cwibAy7xRCASwtkQ
	DifxkfpBOizaIyaYvdzVVzEW7NgjzEYrjRNhozdlxoIs776rOgWnwdaECsnzE8F2nsA7
	ZoLCqAGvIliZKzARyAQPMedwyB/ZN5MElz+6RsaUMVr6d3q8xcp1ZdmFNQKFcsRveWgp
	1LhKCTottm2FaFrmAK4YJDze00FUw5o65Alccl4uz+8S5GjQaGsei8UnJhPjId+Dm8cU
	ehN/piuaKe+M0n8clILl1v1DsSDlBlXdo9gYIadPKGv+WodhhzPuYEPUpvUNlgUZ78/1
	ISjw==
X-Gm-Message-State: AJaThX62pNZcqeDiHjRz9Jf1f8fUWal32/HIMxPGTamOf+P0VdJTV4th
	NvSATENqRKp9JPy0XnNiPwlW
X-Google-Smtp-Source: AGs4zMaBEOpJyQ/Qwp6aO14QJtuacHJxEf0XF9w4VIWGADPzERc4ca0+8k4r5qPyR3KBSVhXOsJ12A==
X-Received: by 10.28.20.147 with SMTP id 141mr2110818wmu.132.1510856888132;
	Thu, 16 Nov 2017 10:28:08 -0800 (PST)
Received: from pohly-mobl1 (p54BD58EA.dip0.t-ipconnect.de. [84.189.88.234])
	by smtp.gmail.com with ESMTPSA id
	r15sm1412500wrc.36.2017.11.16.10.28.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Nov 2017 10:28:07 -0800 (PST)
Message-ID: <1510856886.5979.34.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mark Asselstine <mark.asselstine@windriver.com>, 
	openembedded-devel@lists.openembedded.org
Date: Thu, 16 Nov 2017 19:28:06 +0100
In-Reply-To: <1510845589-10848-1-git-send-email-mark.asselstine@windriver.com>
References: <1510845589-10848-1-git-send-email-mark.asselstine@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Subject: Re: [meta-webserver][PATCH] meta-webserver: apache2 allow SYSTEMD_AUTO_ENABLE to be overwritten
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
X-List-Received-Date: Thu, 16 Nov 2017 18:28:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-11-16 at 10:19 -0500, Mark Asselstine wrote:
> The current assignment does not allow a bbappend to be used to
> overwrite the SYSTEMD_AUTO_ENABLE value in order to have apache2 auto
> start.

Why does SYSTEMD_AUTO_ENABLE_${PN} = "enable" in a apache2_*.bb not
work? It works fine for me with wpa-supplicant:

wpa-supplicant_2.6.bb: SYSTEMD_AUTO_ENABLE = "disable"
wpa-supplicant_2.6.bbappend: SYSTEMD_AUTO_ENABLE = "enable"
=> bitbake -e shows "enable"

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



