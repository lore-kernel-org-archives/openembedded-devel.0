Received: from [66.249.82.233] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1JciIQ-0007Gm-E6
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Mar 2008 15:32:39 +0100
Received: by wx-out-0506.google.com with SMTP id h27so1650511wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2008 07:32:37 -0700 (PDT)
Received: by 10.70.34.15 with SMTP id h15mr3766094wxh.58.1206109954601;
	Fri, 21 Mar 2008 07:32:34 -0700 (PDT)
Received: from ?192.168.1.204? ( [24.107.189.117])
	by mx.google.com with ESMTPS id i36sm761988wxd.20.2008.03.21.07.32.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 21 Mar 2008 07:32:32 -0700 (PDT)
Message-ID: <47E3C6F7.8030902@gmail.com>
Date: Fri, 21 Mar 2008 09:32:23 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: RPROVIDES problem for kdepimpi
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
X-List-Received-Date: Fri, 21 Mar 2008 14:32:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Similar to the tzdata problem. kdepimpi recipe does not define a package 
${PN}, and bitbake doesn't like the fact that ${PN} is missing in RPROVIDES.

Should we ship an empty kdepimpi? Or any better solution?

Regards
Gordon


