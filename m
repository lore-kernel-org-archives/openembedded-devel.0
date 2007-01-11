Received: from [64.233.162.225] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <sdgvulpes@gmail.com>) id 1H4px0-0001jA-8z
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jan 2007 03:45:59 +0100
Received: by nz-out-0506.google.com with SMTP id m22so228045nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2007 18:44:04 -0800 (PST)
Received: by 10.65.251.2 with SMTP id d2mr1431648qbs.1168483444379;
	Wed, 10 Jan 2007 18:44:04 -0800 (PST)
Received: by 10.64.209.2 with HTTP; Wed, 10 Jan 2007 18:44:04 -0800 (PST)
Message-ID: <f34f85580701101844x1efe4edcp4f6c458cfb8263d3@mail.gmail.com>
Date: Wed, 10 Jan 2007 21:44:04 -0500
From: "Todd Blumer" <sdgvulpes@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: SDK problem
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
X-List-Received-Date: Thu, 11 Jan 2007 02:46:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Just for the record (for those who might google for this topic), I was
trying to build Qtopia using the OE SDK (meta-sdk). It was failing
with unresolved symbols of __dlsym, __dlopen, etc. The problem is that
the SDK symlinks for some of the libraries are incorrect (dead
symlinks). I would have thought that the linker would complain about
not finding a resolvable library, but apparently does not. The staging
directory libs have the correct symlinks, but not the SDK. Don't know
why that is at this point, but manually fixing the symlinks causes the
unresolved symbols to go away (as you would expect).

Hope this helps someone else save some time.
--
Todd Blumer
SDG Systems


