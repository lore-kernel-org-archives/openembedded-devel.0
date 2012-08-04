Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SxlS8-0007g2-BQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 23:00:04 +0200
Received: by eekb57 with SMTP id b57so491196eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 13:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=sB3RQKWhzWrdbnwo190EPgVOfz0Ia/RpfMKrDu9l0gE=;
	b=rPxcydgtd0cC7qWqANIT0iIHwpKSNuW+x9kUIWGTSrWX/4VcTst1N5zh2wKhZKEUQd
	PDQ8wRy6nxgKceGVMHO7TEgzqzcxLgGoODHp/KSx0rwD7VMdMyjVF574P5J7+Jn/7XPG
	fQXcJMirDH/NNWB7lyf9mm5zWICOkYDkQQBPI0/pf5YqAFNRNMUJE928CdCwgCztl4em
	FdFkV1eDWAerA3BWiS5WKp1TW7M58U47NcSx0otyh+RO1QPuHhI4oV1W77/0AJ6WySV1
	80CMiVEbfFU1O0fhAEe69S1Ha16DtSWJ469YQIYiSL1DlIiOWDxL8Y4uiSfo2A9s19RV
	0Qiw==
Received: by 10.14.214.197 with SMTP id c45mr7182914eep.37.1344113302081; Sat,
	04 Aug 2012 13:48:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Sat, 4 Aug 2012 13:47:51 -0700 (PDT)
In-Reply-To: <jvk13l$nh$2@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<1343760977-3290-6-git-send-email-raj.khem@gmail.com>
	<jvk13l$nh$2@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Aug 2012 13:47:51 -0700
Message-ID: <CAMKF1sqBGOR=f-e+D8zrguifFbsRzkVLtLsOCf4rxaGKiwPK2Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2 6/7] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Sat, 04 Aug 2012 21:00:04 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 4, 2012 at 1:36 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> As said before, this class isn't angstrom specific and it won't move back to
> angstrom.

koen no one else is using it other than angstrom. but it interferes
with similar class from OE-Core
so essentially you want to keep a feature thats just used by angstrom
in a non angstrom layer?
doent sound logical to me. Would it be acceptable if angstrom used
this feature from OE-Core as well ?
then it will remove the usecase completely.


