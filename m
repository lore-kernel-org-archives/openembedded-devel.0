Return-Path: <dv@vollmann.ch>
Received: from p-smtp-as-01.sunrise.ch (smtp.sunrise.ch [212.35.39.69])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF4060D78
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Jan 2014 22:18:53 +0000 (UTC)
Received: from [192.168.26.4] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by p-smtp-as-01.sunrise.ch (8.14.4/8.12.10) with ESMTP id
	s05MIqBL017585; Sun, 5 Jan 2014 23:18:53 +0100
Message-ID: <52C9DA4D.5010807@vollmann.ch>
Date: Sun, 05 Jan 2014 23:18:53 +0100
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: virtual/fakeroot-native misleading
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jan 2014 22:18:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Trying to bitbake essentially anything requires virtual/fakeroot-native.
But saying 'ASSUME_PROVIDED += "virtual/fakeroot-native"' because we
have fakeroot on our machine doesn't work, as bitbake.conf explicitely
requires pseudo.  So it would be better to drop virtual/fakeroot-native
and just require pseudo.

   Detlef

