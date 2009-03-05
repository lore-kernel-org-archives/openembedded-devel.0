Received: from [195.135.220.15] (helo=mx2.suse.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LfFIY-0006Wv-4n
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 16:15:46 +0100
Received: from Relay1.suse.de (mail2.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 0B2CB47C5B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2009 16:11:26 +0100 (CET)
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id A24B4628082
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2009 16:11:25 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <EC5EE493B6046F45A2DDEC4A828DE52E039C63CF@EXCHSRVR.syntech.org>
References: <EC5EE493B6046F45A2DDEC4A828DE52E039C63A6@EXCHSRVR.syntech.org>
	<1236246311.607.4.camel@hammer.suse.cz>
	<EC5EE493B6046F45A2DDEC4A828DE52E039C63CF@EXCHSRVR.syntech.org>
Date: Thu, 05 Mar 2009 16:11:23 +0100
Message-Id: <1236265883.5297.48.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Subject: Re: Error building gnome-vfs-2.22.0
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
X-List-Received-Date: Thu, 05 Mar 2009 15:15:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Mark Butsch wrote in Thu03/05 2009 at 09:14 -0500:

>That seems to have fixed it. I did notice that your original "DEPENDS"
>line was different than what was
>In the file I had.

Tree was outdated. The point of the change was adding of dbus-glib,
which provides the missing package.

>Also, does this patch need to be made to the "real" OpenEmbedded files
>and how should that happen?

Yes, just pushed to git repository org.openembedded.dev.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



