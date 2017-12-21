Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id B833B78733
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2017 09:09:08 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id f190so10021543ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2017 01:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hzH5ADMRKI228EL2oQeNyucqnDoq+hlDm83yy39tyA4=;
	b=ahx1BnVFrlBLZsy6m6+ddb8BtRLzw4Oo5Qov1ChmNdh+MtyxWOaiYc7pgIdAZUGPVY
	eEAoAmAvo5d3bgMt8nHcaDp7S+wyguJ0tQT8daEfTMGXJTiOtMyCFCqikhE5x80cEKi8
	TmHOLQfUhGF+l25kxSLrI8uFdYUvesg3s9IzqAQGT1+JhlobVr3i+zJw1qgixhony9Lc
	XO1Xt/K945jisr372jAkzkJYq5q61Sj6QApMP53iip9uVc7GoijWtWvicxGBT8jHM1V/
	AvNlZ/ysfGgDvX9X9cwvlsDsPTL2nGN+uuNA3VHltOGlxWyJwNR3rLfMDKqcGaJsvgpu
	cSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hzH5ADMRKI228EL2oQeNyucqnDoq+hlDm83yy39tyA4=;
	b=qs8edgVem4r387CFy1+252OGmiB48MfN7D9kBli2N5xAAoTbhbdfAPDJ7Up0pPwssT
	YuOITJdsJBtCHR+1bivNQXlf/qFIMRqLs2ZweNZ3PARTm2yHGnKEZ1ylQlLOJHSUVFSf
	Az2ZWMA4RKq+mZHfQMZMJdQnQaoBgMaBhilvptF7SLENTEWP6YvSOVqm7sdtQVwXlBRj
	8xBPE3P1edHpfYH3kcA2vvcTXWMFkERHimJjtLMazsMKWTGma0KAvCH1gftZSkImaKtY
	Zm8cBnvbEnTQ8uNfsiutbWv6+d2COA6NZsNagobHB3/fjI0NobzIlEQS6IcNA2gniKFY
	27Lg==
X-Gm-Message-State: AKGB3mLvzh7+Z8Jsco/xUHC05bd4fr9K/tMIM3Dv37nWSqsLutKSZfV0
	X25V54mwdJ7Bxzk0JHb+d58vYEYx4Dz+W8LSI0cEMg==
X-Google-Smtp-Source: ACJfBosKIA4VeyJnYoVulpcOaOi4DOUtkk7G3JMd7Ox0CSZgdj3riF6NVl0hTurkeu9rz/e3tC5WPWAAfQjO647ObAI=
X-Received: by 10.36.80.148 with SMTP id m142mr12139126itb.6.1513847349761;
	Thu, 21 Dec 2017 01:09:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Thu, 21 Dec 2017 01:08:49 -0800 (PST)
In-Reply-To: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
References: <460be213-a6c9-59fa-f8e3-d3f7e6232ca4@dresearch-fe.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Dec 2017 09:08:49 +0000
Message-ID: <CAJTo0LaHXJMMNg8VmqFNne_8rgEV9TER5saUzUXudRgvzggWNw@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] MS Windows machine?
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
X-List-Received-Date: Thu, 21 Dec 2017 09:09:08 -0000
Content-Type: text/plain; charset="UTF-8"

On 21 December 2017 at 06:40, Steffen Sledz <sledz@dresearch-fe.de> wrote:

> Anyone tried to cross-compile for MS Windows target with Yocto/OE?
>

Yes, see meta-mingw.

Ross

