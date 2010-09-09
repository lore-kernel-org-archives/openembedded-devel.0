Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Othrb-0008JI-0a
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 16:12:31 +0200
Received: by wye20 with SMTP id 20so1494406wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 07:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=6s4LpaTxgXY1kGPBW2k3aHc2mUtMp8JoFlfJ+icgXIk=;
	b=aezJVjwThBzgTLGp9elVN4nILRiH0GOapdR0nb7jefd2pe+0np1zJo6Dn6jkmGEMzt
	d995UdfIE5wPOyYRXX4HWAqd8/NJulUkfwwdj3mgGtVeMQGs6G+/PQEVCBI3zxcfOVm9
	3rFO2UlktrHKlaIs30XbH78dfyNdRjKIOyOKo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=l0tvP/MJ7Ff3COZnScChkymYYZZtdiNLgvpzr+SQ9lWKOfIckGaBxixiG1d6BOm6Fc
	BQeAM0SchcViRDAohekj3/fYMl7GNUhwPZu29ibqawmICghV+zvprNpgxq4ykNNhFXNd
	zihPiRDwB+pwkSJy5hIxMuL2EEZDtLBmzbNX0=
Received: by 10.227.137.149 with SMTP id w21mr109002wbt.169.1284041508194;
	Thu, 09 Sep 2010 07:11:48 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.168 with HTTP; Thu, 9 Sep 2010 07:11:28 -0700 (PDT)
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4C38@deimsg40.de.net.world>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4C38@deimsg40.de.net.world>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 9 Sep 2010 07:11:28 -0700
X-Google-Sender-Auth: eQh-3PBkrRORWzV9m7thJbpVkuo
Message-ID: <AANLkTi=ZBDKa_O45MA--ZhY8W0SDyceWREjkvbjyV63T@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: What is the difference of classes sdk and nativesdk ?
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
X-List-Received-Date: Thu, 09 Sep 2010 14:12:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 9, 2010 at 7:01 AM, Hauser, Wolfgang (external) <
Wolfgang.Hauser.external@eads.com> wrote:

> Hello,
>
> in OE the class sdk is marked as deprecated and nativesdk should be
> used.
>
> But all toolchain recipes using sdk class.
>
> What is the difference/purpose of the nativesdk class ?
>
> It is used in OE in few cases, could it be mixed up with recipes
> inheriting sdk class while building a toolchain ?
>

A toolchain can contain both native and cross tools.  Hence the existence of
nativesdk and crosssdk.  "sdk" is from before those two were created, and
its naming is unclear about what it does.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

