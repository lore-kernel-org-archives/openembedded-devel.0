Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5INN-0000Dw-Je
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2013 17:06:34 +0100
Received: by mail-we0-f171.google.com with SMTP id u54so183172wey.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2013 07:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:date:from:to:cc:message-id:in-reply-to:references
	:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=LN/fnCExtTBkfttTzyd8l6jHz+M0ERN34D9tVUA1Cls=;
	b=IoOVVQwKYlRqqADAbzIZ9BRlxw3B+Ik4EfqUwlmtHl7CeMI1pyqr4rfEmcwRpCnZb2
	fJZ/BnLQEevz8ZEIfBX7AYyze4rb3gL4346idFBd68SPz3Qslucrdux3dKj1zb/r6okZ
	Sa2sBSkwZsfAFBY6QW8PA+DWx7C2B/eIlLw3eckW5vc5n1OBcbq8qUtysrO3RseBAtMB
	nBi4tWUHwnJ8ei1RLlIzY87LAxM4hmSyedi6S6cTrBtDQ6PYIERMva03Kn7V/w71IO3v
	uvCOGe+e/fjlNxDevAJzQmSqKbBuR1uNcrLXRWMRS13bhvtdL+l29LSuoi9EIyqT1i2I
	wPcA==
X-Received: by 10.194.158.165 with SMTP id wv5mr31903644wjb.45.1360684233896; 
	Tue, 12 Feb 2013 07:50:33 -0800 (PST)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fg6sm20792272wib.10.2013.02.12.07.50.31
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 07:50:32 -0800 (PST)
Date: Tue, 12 Feb 2013 15:50:29 +0000
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <42BE8E82E93F46829E80D29E6DF4934B@intel.com>
In-Reply-To: <CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
References: <2760168.9kFd94gL1F@helios>
	<CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlGOw3Cnv5vYKyO1JulJ/15XLMB68dPlJdIgM1SeQjspJ86k3kGyBBVK9dQXc7gYYWYE4R7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 16:06:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday, 12 February 2013 at 10:24, Burton, Ross wrote:
> > * meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> > Another bbappend apparently for systemd support. Again, this should have been
> > moved to meta-systemd; do we now need to merge it into OE-Core?
> 
> 
> Yes, half of it has been merged to master already. The rest should be
> in Radu's branch, we can sort that today.

I take that back - polkit in oe-core supports systemd if enabled, so this append can be removed. 

Ross


