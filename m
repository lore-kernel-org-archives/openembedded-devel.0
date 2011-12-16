Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1RbUJn-0000wj-3F
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 10:43:07 +0100
Received: by ggnh1 with SMTP id h1so2690653ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 01:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=LSHU3FnS8d/VE3jYzNRt9gXSI+kfuTCLRFttWde82aU=;
	b=Jrp2xqmzUu4p1pijOtqYqXu+gL1bP4o3c/O1g5M1qAeh+ceHfs6L4wIrzIikbQjkr+
	dvBqt+/mTjZAa3nNe4XlmWvYM1WV5GONEQi7EMxXFOyNlgD4onugOq30U0Q5nzoKkkXw
	SrfP+evSSf2EK31MsrvaTsXjVe7+kJMbXw+wE=
MIME-Version: 1.0
Received: by 10.50.94.170 with SMTP id dd10mr7539910igb.41.1324028167027; Fri,
	16 Dec 2011 01:36:07 -0800 (PST)
Received: by 10.231.85.139 with HTTP; Fri, 16 Dec 2011 01:36:06 -0800 (PST)
Date: Fri, 16 Dec 2011 10:36:06 +0100
Message-ID: <CAOHjBZtWd8-_xgqbzx=jBjA4=tRD3CHJ62YiA=dzFr9QsUzaVA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Question about package prefix
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
X-List-Received-Date: Fri, 16 Dec 2011 09:43:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I need to package against a different prefix using rpm. I mean, I don't
want to have to files located with
the absolute path (i.e. /usr/lib/ etc...) but I need to have them under a
specified path.
How can I obtain this? I saw conf/bitbake.conf contains many variable to be
accordingly set (prefix, exec_prefix, etc...)
but if I modify them the build will be broken. Also, looking at the
distro/<distros>.conf files I have not seen nothing similar.
Please can you suggest me something to solve my issue?

Thanks,
Giuseppe

