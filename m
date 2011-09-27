Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1R8ZOn-00018u-Rc
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Sep 2011 17:16:45 +0200
Received: from [192.168.0.101] (91-64-80-26-dynip.superkabel.de [91.64.80.26])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 611B61B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2011 15:05:46 +0000 (UTC)
Message-ID: <4E81E5F5.8080603@freyther.de>
Date: Tue, 27 Sep 2011 17:04:21 +0200
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E81B106.8040801@tu-braunschweig.de>
In-Reply-To: <4E81B106.8040801@tu-braunschweig.de>
Subject: Re: Debugging OpenEmbedded Builds
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
X-List-Received-Date: Tue, 27 Sep 2011 15:16:45 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

On 09/27/2011 01:18 PM, Christian Keck wrote:
> How can debug an OpenEmbedded build? I have made some changes to a board file,
> but it seems that my changes have no effect. Is there a opportunity to look
> into source code just before they are compiled?

you can use bitbake -e recipe, to see how variables and scripts that will be
executed look like. also it generates scripts in the temp/ dir in WORKDIR that
can be inspected, also bitbake -c devshell NAME gets you into such an environment.


