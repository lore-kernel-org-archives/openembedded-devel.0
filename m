Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PVA9T-0004Qi-SL
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 22:53:47 +0100
Received: by wyb40 with SMTP id 40so4492624wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 13:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=ta49gEa6e7IbKcXYiSesuuXQTMMtc3GXR3SzrXNgcZk=;
	b=CXjOXxikl+YhMdqS4MBCLYGw4MbYATdeHjAocrBXvqDYGc7hzA2YWmz0GIOXaJh8DU
	a1ASgD5nhgtNsyDYwT5ISn3gvPw2txJZ2V0U5PWe7Lgm+qRXUVVnX909SSrGGOeRjjS+
	AkzbhnLu7MtISx6RPRWjms05laVonls1K6Lj4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Bw1fskony75wuxFVsdTlJsxZ2Een1oArhplezESpTvJHVe+38GRYgd5eCaR0DYQAiV
	68rrtZbnhJCDLle5q7WgtatYgExKNXtwPf2ONadjKXtDu3IpqN3B9qfzMnFhHRAct6uL
	nnhnjuQ0FPf5he0GMX/QpY3NDkiDJ0E8/YhrI=
MIME-Version: 1.0
Received: by 10.216.169.71 with SMTP id m49mr6823201wel.4.1292968420831; Tue,
	21 Dec 2010 13:53:40 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Tue, 21 Dec 2010 13:53:40 -0800 (PST)
Date: Tue, 21 Dec 2010 16:53:40 -0500
Message-ID: <AANLkTin7=Y-zTioQWoMegS4pU3McHnORx-jC+z6petZ-@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: OE git repository organization
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
X-List-Received-Date: Tue, 21 Dec 2010 21:53:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Now that we have the capability to do per branch permissions, etc, I
would like to discuss what makes sense going forward for repository
admin.  My initial thoughts:

- put all user branches in openembedded-user
- restrict branch creation on the main openembedded repo to commonly
used branches

We can also do things like give users permission to branches that
start with their name, etc.  This would allow rewriting history on
user branches, etc.  That said, it may make more sense to just do user
branches on github as some are already doing.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


