Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1Q4OIl-0005Fe-Ch
	for Openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 04:04:59 +0200
Received: by fxm19 with SMTP id 19so3468287fxm.6
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 28 Mar 2011 19:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=nrmQylWSvaUyoMqE0ZF4G9yDKqbQ6nMiP7xySuKH3UU=;
	b=jLQYInGLOiOkT8tcYV1R+rz13jlxScDdVAe9aCvZFDCSia7gukVdCz6W925MriG+Ve
	zWlLyIviUYd0l8+ZI8HRJ+LYc7SonDx9aWwQQjsXERjx6l84l9u7dwFT9PcsIqwosq/c
	qSUwalSrqMSPb9BE2vM7RoCNK4gLwVEPl4Uoc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=xuFAnNnlC3HIoPdqKyx3PcBvmvvmHlH7CLUG73IOjEBRf/R8qTvy8I/RcxQ8QM0YW+
	NrS/Viwb5JZcZ2YR7ZMLnnB2svs3quGqom6/WVygG0Cfk0AzozHvCi9DzhZktERUcyYj
	U3Z+GjPPJVkMg+jq0ue5HobSxRZNwQcYMYJpk=
MIME-Version: 1.0
Received: by 10.223.17.202 with SMTP id t10mr712334faa.139.1301364182251; Mon,
	28 Mar 2011 19:03:02 -0700 (PDT)
Received: by 10.223.96.129 with HTTP; Mon, 28 Mar 2011 19:03:02 -0700 (PDT)
Date: Tue, 29 Mar 2011 15:03:02 +1300
Message-ID: <AANLkTinndYKCjXukE90p0yGuh1KCtm1joySugGMQXrTU@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Subject: Modifying download directories
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
X-List-Received-Date: Tue, 29 Mar 2011 02:04:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All

I am fetching various modules from svn and need to create a specific
directory structure with them. I'm struggling to find the correct
combination to make this work.

If I use
SRC_URI = " \
        svn://xxx/svn/a/trunk;module=Common;proto=http \
        svn://xxx/svn/a/trunk;module=Core;proto=http \
        svn://xxx/svn/b/trunk;module=HAL;proto=http \
"
that fetches the modules so that I end up with

${WORKDIR}/Common
${WORKDIR}/Core
${WORKDIR}/HAL

but what I really want is;

${WORKDIR}/foo/Common
${WORKDIR}/foo/Core
${WORKDIR}/bar/HAL

because that is how the Makefiles are set up

Any advice welcome.

Thanks

Charles


