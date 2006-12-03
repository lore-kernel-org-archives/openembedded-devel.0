Received: from [64.233.162.237] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Gr0Kd-0000R0-EW
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Dec 2006 00:01:12 +0100
Received: by nz-out-0102.google.com with SMTP id m22so1653979nzf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Dec 2006 15:00:27 -0800 (PST)
Received: by 10.65.176.7 with SMTP id d7mr11713944qbp.1165186827277;
	Sun, 03 Dec 2006 15:00:27 -0800 (PST)
Received: by 10.65.230.8 with HTTP; Sun, 3 Dec 2006 15:00:27 -0800 (PST)
Message-ID: <c384c5ea0612031500o3ee66a23x89d72a948f418532@mail.gmail.com>
Date: Mon, 4 Dec 2006 00:00:27 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Recent OBJDUMP changes
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
X-List-Received-Date: Sun, 03 Dec 2006 23:01:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I seem to hit upon a recent change involving finding shlib
dependencies using the objdump | grep NEEDED approach by Graeme
Gregory/XorA:

http://www.openembedded.org/viewmtn/revision.psp?id=1fb8812d36f505cfabe9ee2335441ada60e32f83

Shouldn't (BUILD_)OBJDUMP be defined instead with a BUILD_PREFIX?

OBJDUMP uses HOST_PREFIX, which seems undefined during packaging
(using package_ipk).

Regards,
-- 
Leon


