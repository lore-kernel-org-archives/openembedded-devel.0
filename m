Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PqBbP-0004s5-7X
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 22:41:31 +0100
Received: by qwi2 with SMTP id 2so2731667qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 13:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=EAOA6r/PNelgBp7hmQYkosyVSNezZoxhpeeRWcw0Cy0=;
	b=mRGX8GxiulS2ORMXbp/HIxxa9hnWwHcZVheFNrI2Vj7vo7QYbshDGulvlP8pZekAl4
	VxUsaPrWMd//yPRMaL2+zZsOpNq6eWcA7zssbXd013KnpiwmoaVwWE90VoLJe2zrfA9m
	2r/riawxRbxnRU9w3g6Y1DvDJNMmHVPLGFg3E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=YGEDfgTOosWvpvVG+iWOraNpOnkq61y4YMiRQtIur/xQ9jlzlBdK0qnUlztKQ2v542
	nN/2YFsM2zCoSSu0EZIlwx7mivpc8VGZJr+vMOOaouzbAYBgtNTp2jFD1pwUYL0jwIw/
	4eZIwBajV8ikS4EFReHDpHcgjyJX4VTW2ezgE=
MIME-Version: 1.0
Received: by 10.229.241.194 with SMTP id lf2mr2830843qcb.222.1297978817442;
	Thu, 17 Feb 2011 13:40:17 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Thu, 17 Feb 2011 13:40:17 -0800 (PST)
Date: Thu, 17 Feb 2011 22:40:17 +0100
Message-ID: <AANLkTinr=zf_zn16kQrx4h=ZTVnJnZyQVE46oLjN+v-Q@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: deb packages architecture problem.
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
X-List-Received-Date: Thu, 17 Feb 2011 21:41:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

there is a problem with deb packages.

When installing packages on the target system dpkg complains:
"package architecture (arm) does not match system (armel)"

The question is - should we convince dpkg that the architecture is
arm, or build the packages so that their architecture is armel?

First solution may cause some problems with dpkg not expecting this
value on a particular system, the second means potential bugs
resulting from a deeper change in OpenEmbedded.

What do you think?

bye,
Filip Zyzniewski


