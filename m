Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LnHFL-0000wO-DR
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 19:57:39 +0100
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LnHDX-0005cD-W4
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 21:55:48 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Mar 2009 21:55:44 +0300
User-Agent: KMail/1.9.9
References: <1238173051-2118-1-git-send-email-khimov@altell.ru>
	<49CD0AB7.3010309@dls.net>
In-Reply-To: <49CD0AB7.3010309@dls.net>
Organization: Altell Ltd.
MIME-Version: 1.0
Message-Id: <200903272155.44181.khimov@altell.ru>
Subject: Re: [PATCH] dialog: update version 1.0-20050306 -> 1.1-20080819
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
X-List-Received-Date: Fri, 27 Mar 2009 18:57:39 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Mike (mwester):
> No comment on this particular patch, just in general I want to note that
> one cannot assume that just because the sources for an older version
> might be unfetchable on an official download site is insufficient reason
> to delete the old recipe.

Well, FTBFS on one distros and building fine on other is not right IMHO. 
I've also checked that none of packages depends on dialog currently and no 
distro specifically sets PREFERRED_VERSION. So if I just add this dialog 
along with an old one it will be autoselected in every distro that is 
present in org.openembedded.dev tree.

Of course, if there are reasons to keep old recipe, I have no problems 
fixing the patch. Just currently not seeing any.


