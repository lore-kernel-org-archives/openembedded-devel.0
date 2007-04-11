Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HbYGC-0004j9-5Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2007 10:33:00 +0200
Received: by ug-out-1314.google.com with SMTP id e2so62335ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2007 01:32:59 -0700 (PDT)
Received: by 10.67.91.6 with SMTP id t6mr285962ugl.1176280379494;
	Wed, 11 Apr 2007 01:32:59 -0700 (PDT)
Received: by 10.66.251.2 with HTTP; Wed, 11 Apr 2007 01:32:59 -0700 (PDT)
Message-ID: <c384c5ea0704110132s27b28fcifba5fc2db437e167@mail.gmail.com>
Date: Wed, 11 Apr 2007 10:32:59 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: deterministic OE builds - multiple providers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2007 08:33:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

in trying to build my OE snapshot with a small extra bitbake
collection to keep mildly customized .bb files across different Linux
hosts.

In tracking down a host dependency I found that in cases where
multiple providers are present, the behaviour is undeterministic, i.e.
a provider is picked more or less randomly.

Can someone confirm this?

If this is the case, can we make it obiligatory to demand that in this
case one single provider must be explicitly and unambiguously defined,
and otherwise fail the build?

Regards,
-- 
Leon


