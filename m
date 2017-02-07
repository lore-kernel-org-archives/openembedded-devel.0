Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3862A600EB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 19:10:50 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id v96so98053533ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 11:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=dQmVb+rn22PkkU2GoL1aKjyCBOyIe/JzyP9nUSWhCBA=;
	b=0yWLFB8cUaa47l4oCtTQYb81DOiYVtVvOrnbbZIqBpVZNQxaxZ9kMJ1PQZT+S8f6Un
	K1yWbZjz3TJRR6y8cbhdA9ySrz3TXf8ZvuK9PRR+6DKNTyks4h9LbJU+sWP4F05/flO5
	CH2MrZo9ub+9VGormwQG13YqjF3s6V7NH/wmfD0EjG9fqkVLZHDL/2/O7fW618usAymg
	ENR7MfOtQTMAkD/GUb5m1Z1n2Pf/AEarWEyCXgixuiLRuNhtdsx3/ESktiJXCMAzbLgV
	mS6OwiLsvKIRLP+2utwVOIcZw5PJD2vxCNsBPLM0mpvnLcmsNvdrRV9Eky4eSofmJJdG
	wVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=dQmVb+rn22PkkU2GoL1aKjyCBOyIe/JzyP9nUSWhCBA=;
	b=I8DO2ghfq2AV7CfYXLrRHQTVFNzztYE5CVXLnyrtFZeqM5Lw81WSoLbJIXdR0Edqrj
	x5MKh7CoKDYa11tBQTZqvJIjvCl7MsLSh8geSPRm0ndBV07FGUqTvXWBHdCRqtJ7jZAv
	pvgsramMwA/KApl6iTFg18nrptSEkkxwz/RBtr5midopi+C5YOPp1xGl7zIYLAbXVdiQ
	mkcamojFsy74AYbh9H+SZ2bZcbf0FUke+ajQa0YnBEySHac+gekxYjDG76YFZ1oeCGpb
	Db87vVD2FhVuk5NAsQLyrPMtijkPdXV4S2za21XA3w5Y38dQ0167pMUOCxHJpHAHnEtA
	72nw==
X-Gm-Message-State: AMke39n+egNlXQLIAGJQqk2O3CrQP+GzUbImuP62/Qyoa4yL0khkC5rcWXVlWI/7j9TRKihG
X-Received: by 10.107.186.136 with SMTP id k130mr5599538iof.195.1486494650585; 
	Tue, 07 Feb 2017 11:10:50 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DF93.dip0.t-ipconnect.de. [93.232.223.147])
	by smtp.gmail.com with ESMTPSA id
	j74sm9976125iod.44.2017.02.07.11.10.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Feb 2017 11:10:49 -0800 (PST)
Message-ID: <1486494646.14889.144.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 07 Feb 2017 20:10:46 +0100
In-Reply-To: <17a923eb-ec4b-1401-8277-cba1ddd1aae0@linux.intel.com>
References: <1486399174-28949-1-git-send-email-akuster808@gmail.com>
	<caa1a269-b4e4-9909-967f-c637146fc4ba@gmail.com>
	<1486453274.14889.135.camel@intel.com> <20170207102518.GA3276@jama>
	<1486465148.14889.140.camel@intel.com>
	<17a923eb-ec4b-1401-8277-cba1ddd1aae0@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: Patchwork-Status via email
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
X-List-Received-Date: Tue, 07 Feb 2017 19:10:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-07 at 12:32 -0600, Jose Lamego wrote:
> 
> On 02/07/2017 04:59 AM, Patrick Ohly wrote:
> > What about this use case here: the original author wants to retract a
> > patch. Can he do that via email and/or the web interface?
> > 
> Patch submitter (and project maintainers) can update status manually
> through the web interface.

I suspect that this makes the email interface less useful that it could
be. May I suggest that we relax the permission check so that also patch
authors can change the status of a patch?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




