Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1L8HtW-00012G-90
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Dec 2008 18:21:42 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id A9C076280CE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2008 18:18:07 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gh8tup$11g$1@ger.gmane.org>
References: <1228384295.14968.63.camel@hammer.suse.cz>
	<gh8ge9$gff$1@ger.gmane.org>	<1228396188.14968.188.camel@hammer.suse.cz>
	<AC214253-0411-451F-9A25-04D0F6174B90@student.utwente.nl>
	<1228404803.14968.296.camel@hammer.suse.cz>
	<gh8tup$11g$1@ger.gmane.org>
Date: Thu, 04 Dec 2008 18:18:06 +0100
Message-Id: <1228411087.14968.309.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Subject: Re: broken shared-mime-info and MIME typing
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
X-List-Received-Date: Thu, 04 Dec 2008 17:21:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> You want it to error out of u-m-d is not found, since the purpose of the 
> postinst (updating the database) couldn't be done. Do you have a 
> use-case for this non-error behaviour?

> I'm not sure what the above accomplished, apart from making it easier to 
> shoot yourself in the foot. What's the usecase for allowing to install 
> the xml files, but not the update tool (assuming you applied the changes 
> below)?

These XML files are important for consumers (typically file managers of
desktop systems), not for providers (packages providing a description
for its own obscure file format).

If you want such packages installed on an image with the desktop systems
that does not support shared-mime-info, you don't need shared-mime-info
nor freedesktop-mime-info packages and you will save ~1MB.

During installation of shared-mime-info+freedesktop-mime-info the
database will be created.

> If you're going to package those together you should name the package 
> 'update-mime-database' to avoid confusion when people want to install 
> the utils and do 'opkg list | grep mime'.

Whatever name we pick, allowing to install update-mime-database
installed without freedesktop.org.xml is a bad combination.

Having generated data files without both of them seems to be safe.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



