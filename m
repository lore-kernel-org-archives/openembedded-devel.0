Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <erik.boto@gmail.com>) id 1LMhBO-0001Jw-EK
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jan 2009 12:11:42 +0100
Received: by rv-out-0708.google.com with SMTP id f25so12721686rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2009 03:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=oyioWFnj2u3TyiciecSc9D2VnJ/pxtchpDbdBDg6lkE=;
	b=QeqDQ/ZeQdfKvCiCbBzQVJeIFYKhiV8MPktk9/9I2oNO9z0uzrNCrdFj2OLmr8EW6v
	HpDAhnlRpWahUFyGVvzfoRh6cyPHaTtSoIGE7fcR4kYf8bcHJdzHCOJ3QAjiQv6QT9vK
	fjh1MRnc8QhWYh6Pzx+keAH37LT6BeU3K2h2o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=giRiSf6B88zjtp+bPch9kinBtwXzk9RQit33URxWw2mFPfo2SaSt8lxVGo7pq8+mo6
	WTiPzZj42Loeez8y+VeGnOrQpKnMDGmdZEFxCdQu7FaDdS7jcf9plLXApqBQttnEDcB7
	M1JP78RoVqyPO9a6+4VFQxsaeFbtU/Lm38Nio=
MIME-Version: 1.0
Received: by 10.142.164.10 with SMTP id m10mr12821794wfe.184.1231844711648; 
	Tue, 13 Jan 2009 03:05:11 -0800 (PST)
Date: Tue, 13 Jan 2009 12:05:11 +0100
Message-ID: <d6d644b80901130305j687168fapb3fa7659f2696742@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Qt-app won't build since libQtUiTools not included in staging
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
X-List-Received-Date: Tue, 13 Jan 2009 11:11:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I'm writing a bitbake recipe for a QT-app that tries to link against
libQtUiTools but it fails with:

/bin/ld: cannot find -lQtUiTools

I think this is because this file is not in the staging environment (I'm
using qt-embedded-4.4.3 for building qt). I checked the qt_staging.inc file
and is seems that all .la libraries gets staged but libQtUiTools is a .a
file and not included in the staging environment.

Is this intentional or should it be included?

Best regards,
Erik

