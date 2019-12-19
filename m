Return-Path: <jdmason@kudzu.us>
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id B73AA7E553
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 17:21:30 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id a6so5495325ili.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 09:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=CALYvEE+WiUpa0RudVb5rD4981KeWVLrMplCS7UpcQ0=;
	b=XVAG2SdREEndAKOWVQiorQG5PK+27RSLev1zhAw5D9gXo9m4dMkpi91W0qfcsYwdxi
	RFAgyG+vbKsYScK1bNCh6G4ZMB9tgQYsCijIJ+YJ1InpDtgH5/dT7afyxFZY8Is0C/5I
	74Hjgr5vgOeOL5IQDlg/QtQciVrCbDO8dKte/HflCFW/X/IV1BEZJDVu7jG1+i8y/W5Q
	NFbdCrybIAhyYn+wbko60auUUkJNrwc4TA265HwIPyYSnjPHFrByrfmRXCiyHOwHmVEt
	CiKX9RAYybpUl2KAnd+AR64JxMrfCLQCWwhGhlFXvxC8xYrMh7yit0KX5aE3LCzYxk6u
	Kb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CALYvEE+WiUpa0RudVb5rD4981KeWVLrMplCS7UpcQ0=;
	b=I4oxAPhVV3FjWCiHsc7FK7Z0knxHATpOJQS3sU4sxVQT/j4A4Dej1YAgXXVHJVfQvg
	QHx/z58V4iTSkJ8VkB65222yw6dDcpQbIueFDu5jf8GfX82GMwQDo/+wiN4dUzDCY/OV
	iANktIdlcaYltp0DE/VoqytzxcUYF3Y8+NGUFB+bv6CVebiGwPkhaUKW0YGk7CoACUtD
	gPHy+xZqqfBBMH7rwMLSKvaqnKriwtrbfkjqIfX57A+mohtKD25WBvyNqrWkgSDADqfs
	q3js8HO9Fgd4nyuLsJPOx5j7COfI0L5kj+SUaTgZpesy40R0/KkVqz/5EGAPKLdaSLRe
	aWzQ==
X-Gm-Message-State: APjAAAU36lo1cE8MEBFhSGqYsyFc+ls7neBTjbinzkRqlDac6HjEZdPW
	ffMxxSFG81JsiH8fIddCqH4ONgVrk/fNw42wTlYEYmtl0NXgWg==
X-Google-Smtp-Source: APXvYqyg+xaMwZQ4+5bx6f+2QXwRBGu+kq+RUHS/Gnevp7iPtaQ4Qh7dZjQrnasrM38GMJnikNew2LWmssW7L1w17+A=
X-Received: by 2002:a92:770a:: with SMTP id s10mr1903519ilc.159.1576776091307; 
	Thu, 19 Dec 2019 09:21:31 -0800 (PST)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 19 Dec 2019 12:21:20 -0500
Message-ID: <CAPoiz9yiD_BHeqZ_M42vyf7bcs9RLM-91Ba=+iX87_nqnMffQg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: lmsensors recipe broken
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
X-List-Received-Date: Thu, 19 Dec 2019 17:21:30 -0000
Content-Type: text/plain; charset="UTF-8"

I'm seeing the following when I add lmsensors to my build
--> Finished dependency resolution
Error:
 Problem: conflicting requests
  - nothing provides lmsensors-isatools needed by lmsensors-3.5.0-r0.aarch64
(try to add '--skip-broken' to skip uninstallable packages or
'--nobest' to use not only best candidate packages)

I have not been able to find anything that provides that (and if not,
should it be a dep?).  I simply removed the line, and it built and
worked (for my limited testing).  Am I missing something or should I
just send a patch to remove that line?

Thanks,
Jon

