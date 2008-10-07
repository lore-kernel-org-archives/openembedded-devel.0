Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1KnBz4-00070L-6J
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Oct 2008 14:48:14 +0200
Received: from [192.168.1.67] ([::ffff:78.86.128.56])
	(AUTH: PLAIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Tue, 07 Oct 2008 13:43:40 +0100
	id 0006D06E.48EB597C.00005AEF
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48EB5730.8030700@opensimpad.org>
References: <48E6624C.7000409@opensimpad.org>	<gc72hu$i8f$1@ger.gmane.org>
	<48E758CB.7040209@opensimpad.org>	<48EB45F0.8080809@opensimpad.org>
	<gcfi87$g4t$1@ger.gmane.org>  <48EB5730.8030700@opensimpad.org>
Date: Tue, 07 Oct 2008 13:43:39 +0100
Message-Id: <1223383419.13122.7.camel@aquilonia>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.0 
Subject: Re: X/Qt2 opie integration (patches included)
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
X-List-Received-Date: Tue, 07 Oct 2008 12:48:14 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

On Tue, 2008-10-07 at 14:33 +0200, Bernhard Guillon wrote:
> For a useful xqt2 xkbd is currently needed because typing on opies 
> keyboard kills xqt2 except of this it is quite stable on my simpad.
> 
Many years ago I fixed this, its because Xqt tries to instantiate some
unicode codec which we don't build into our qte. It fails, doesn't check
for the null response then segfaults.

Cant remember what the fix was, but it wasn't too difficult.

Graeme




