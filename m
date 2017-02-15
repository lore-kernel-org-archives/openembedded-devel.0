Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0668071C9F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 08:07:43 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id l66so84656041ioi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 00:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=R1429937qFCr+48mnM1CI/6DgNNrrKIssQsph1GV+EA=;
	b=q7PRAMVGJh8uKbReGAuMQSje1/aMVX5NAN4YpFJWAjpa227st52HlrjZJ8hXiX6M8d
	IXSmMhLu+liH4ED8OqrqVyI+asvkXxkTLO2DuhHEkyXyN90BXFtEVuLqLqkoMmknKp++
	ApWj3hSiLXbzIfOEWR0STvmYIWe16bXcrisbSSo3PTV182CDbBegCRLGHgZrQ7KP+XDz
	8e8E19ylQp7Yo0wF+8onZ/EukSlkRQtovmBffLGYbrLkahNbAh6aJlY7nym5dv34JU8C
	WfwHoZ00pSG9OksKD8gKL7uwS66eYMwW+oQ4Pkzv4FStKL7QU61guzDNo20XozskJsQZ
	zbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=R1429937qFCr+48mnM1CI/6DgNNrrKIssQsph1GV+EA=;
	b=Icpi0Jxh0nElHR34KZchVdYBegK4FV2/5730MIc56q38pJNETPNw8GWmizziHZM2cH
	R2rITmKNUa1XQDjjT6w9C533g/vvpPyX+DBu3pgW5GfL0oy1A4xM2fh0tZAenEZopkyo
	A5lwnDxeVBLAE9zZynOyV9ah93p8Nn+elqVb2VjNwVVwiO4aPg1Yo+9rgKC0/NTDDTcB
	qJEZj7nx2f1GbXxLM7jYQk8ndwE+4wZgC5EKhdZvY6zuFMNoqDsOQsK5ynNqawXVTj8g
	NH4Fwuk/IDbV++sMjOckTisXr5YdXfkglzo7/sYtEXjaoa2aI75cDArChFcYsUi3UpwN
	Oijg==
X-Gm-Message-State: AMke39mtkb1Id8zEBwa6cxlI5pkTS3l6/VUkK+MFO5IcCQUKnxkABl1D3mCSjIknTIivm1nG
X-Received: by 10.107.128.89 with SMTP id b86mr30051924iod.93.1487146063669;
	Wed, 15 Feb 2017 00:07:43 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E563.dip0.t-ipconnect.de. [93.232.229.99])
	by smtp.gmail.com with ESMTPSA id
	w133sm2422044itf.2.2017.02.15.00.07.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Feb 2017 00:07:42 -0800 (PST)
Message-ID: <1487146060.13854.371.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Feb 2017 09:07:40 +0100
In-Reply-To: <1487108941-20285-1-git-send-email-max.krummenacher@toradex.com>
References: <1487108941-20285-1-git-send-email-max.krummenacher@toradex.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-oe][PATCH v2][master-next 0/4] python-m2crypto now rdepend on python-typing
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
X-List-Received-Date: Wed, 15 Feb 2017 08:07:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-14 at 22:48 +0100, Max Krummenacher wrote:
> For native packages the rdepends do not get automatically installed in the recipe
> specific sysroot.

I'm still not certain whether that RDEPENDS problem is intentional or a
bug which needs to be fixed - see "[OE-core] Does recipe specific
sysrooot (or whatelse in current oe) break native dependencies?"

I don't know how long it might take to resolve this, nor how urgent this
problem is for you, therefore I don't have an opinion whether merging a
(temporary?) workaround is better than waiting.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




