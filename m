Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <zecke@selfish.org>) id 1IplIm-0001U6-Cw
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Nov 2007 14:50:41 +0100
Received: from dsl-62-220-14-162.berlikomm.net ([62.220.14.162]
	helo=[192.168.2.131]) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <zecke@selfish.org>) id 1IplHw-0008Bp-CZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Nov 2007 14:49:48 +0100
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <9726e5bab4d4cea59c08c70dbf3d05cc@127.0.0.1>
References: <1EF150F3-338E-469F-8AA4-7816799D3F55@selfish.org>
	<9726e5bab4d4cea59c08c70dbf3d05cc@127.0.0.1>
Message-Id: <DE6B0634-36EB-4700-922E-7786BCA99F64@selfish.org>
From: Holger Freyther <zecke@selfish.org>
Date: Wed, 7 Nov 2007 14:49:39 +0100
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
Subject: Re: Why not use config.guess in conf/bitbake.conf ?
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
X-List-Received-Date: Wed, 07 Nov 2007 13:50:44 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 07.11.2007 um 08:30 schrieb Esben Haabendal:

> Ah, nice approach. Didn't notice that.
>
> But.... this file will be included after
>  * build-${BUILD_OS} is added to OVERRIDES
>  * STAGING_DIR_NATIVE is set to ${STAGING_DIR}/${BUILD_SYS}

Consult your bitbake manual. The variables are not expanded at this  
time, at least they shouldn't. Do they get expanded for you? And when?


z.



