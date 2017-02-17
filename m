Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0499C6FFA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 07:38:55 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id g67so7157190itb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 23:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=SL8oC7hdIp/PYelrTVs/9uCn0uCXQ3pw/GV6h9glFg0=;
	b=gPFHistCcEGY9ZfpZMsOQqL6vNaTIRsXZ+oOWlXW+EXWLt1EwIX1vZjH5J9PQ9R8+T
	iBH7LovsF9tq0RQ+KYnR1238G2JE+ziJuejKrxvd3evr3BTK36XIVdHx9VAf569j6vXj
	+q1KH8oNqKAFQSBtsbSog9bkA2yujFT7uk+xlYcZTFzz4Hi7XUlNhHQdLezlSFW5C3V1
	2VP2LHxYIxBWOKqfKFkqPrGvYKdyeNThn1YN0T+FhAbpXyxVt3JlzCKOgiuqPCPJOu9w
	i+SiKdDMiSQ9P+NTHxhaHJ4urX6PCt2Tes4VcfdL7bUKLj70M++x/V0bqyZLvEKTtkwv
	eMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=SL8oC7hdIp/PYelrTVs/9uCn0uCXQ3pw/GV6h9glFg0=;
	b=U2erwmjgz7K1QR5LFatiYf5BF/CX7IWMEfqHASgEoImm4ivGS43Pb2+fiaIwSyblAS
	L9Tiw7KlzjN9qvXjyp2S3usfD6Y+CACson60/NzLji5gWCa354wI6NIPqFILa+A3xCFE
	vzpLDADIrIaZJaigoRQ5A48kqzKCowPmV8xz0Xglt4JeZi3BrHRzHd9Z1XITnytCbzaT
	X68LigccyvTWbXR6GT0U31XsoFb5ebMLmCIRWbN2Fi9bSyjf8KLTPIqH8AKYGkrZP0i4
	X3gA1oeyoENLuZDvFPkeT4co9+41hsT1zIrzmfifTTd82J/Xh/sErxYJB/eO7bYOl0b2
	pANA==
X-Gm-Message-State: AMke39m4k/Aupc+F2QiGRhf60wzXOSSrpqd1EYnIrGzo2ZSzGo0Yd0fQtm5z+jOUIgqroxv9
X-Received: by 10.107.185.65 with SMTP id j62mr5412345iof.3.1487317135737;
	Thu, 16 Feb 2017 23:38:55 -0800 (PST)
Received: from pohly-mobl1 (p5DE8FD56.dip0.t-ipconnect.de. [93.232.253.86])
	by smtp.gmail.com with ESMTPSA id o20sm323741ioo.37.2017.02.16.23.38.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Feb 2017 23:38:54 -0800 (PST)
Message-ID: <1487317132.13854.508.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Feb 2017 08:38:52 +0100
In-Reply-To: <1487092855-32555-1-git-send-email-aaron.zinghini@seeingmachines.com>
References: <1487092855-32555-1-git-send-email-aaron.zinghini@seeingmachines.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [meta-swupd][PATCH] swupd-image.bbclass: add missing expand arg in getVars
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
X-List-Received-Date: Fri, 17 Feb 2017 07:38:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-14 at 10:20 -0700, Aaron Zinghini wrote:
> Add "True" to d.getVar() to avoid forking a little while longer.
> 
> The expand arg has been set to true by default in master branch and breaks compatibility with branches.

Thanks, applied to master-next (not pushed yet). The right mailing list
for future patches is yocto@yoctoproject.org - I had gotten that wrong
when summarizing the patch submission procedure for you.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




