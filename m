Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LhgJh-0004YU-GE
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 09:31:01 +0100
Received: by bwz9 with SMTP id 9so283154bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 01:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=6NQMY8qYjCE/TkxcAaLxgsueKRjkBqVnlR1oiNNMy14=;
	b=nFTa6rVL5ELvIwguue4IzFyztFHYFPfGAsqOx4JuPeHm/ZKBGTgb4AEFJHYi+15W2C
	NiWmKdRd0eHUyNsdbavVIBnrKogvCMyYH8vzieo1uCOWfPG3KffUepXqGvyzx0BYmDOV
	+3WmtM3QfTCmJaP6TJ7Mgcd3jeVfizX1ZigTk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=itiMTuOvJY1CnrypXoZgK3uKrxHfWzcbIkel8qtxNe/NGryR3f9j+ZntIyXgDQkG9i
	mD0Pl7KEVtE+5nVck3zH6IZz44yXIdT9Oh34XdsxojUpKCrCOJY7uC8yzACgsGLCvDni
	mgQQohrDu2sCwQ/r7btxnkatfnLsmq1h3LDQc=
MIME-Version: 1.0
Received: by 10.223.107.9 with SMTP id z9mr7107360fao.1.1236846647328; Thu, 12 
	Mar 2009 01:30:47 -0700 (PDT)
Date: Thu, 12 Mar 2009 09:30:47 +0100
Message-ID: <ac9c93b10903120130v5c19e5fbq224df848792f3a5f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: do_patch fails if path starts with ./
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
X-List-Received-Date: Thu, 12 Mar 2009 08:31:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

When generating my (normally small) patches I typically do a cp file
file.orig in the work dir, then change file and at the end do a diff
-urN path/file.oirg path/file >file.patch
no probllems with that (although if there are recommendations to do
things simpler/better, I'm of course open to suggestions).

However yesterday I copied and pasted filenames and ended up with
diff -urN ./path/file.orig ./path/file >file.patch
of course then in file.patch the filenames starts with ./
when that happens do_patch does not find the file.(probably because it
thinks there is an additional directory because it does not see that
./ is actually the same dir)

is this a bug in our build system? or in patch?
or should I just avoid using ./ if I create a patch?

btw: I alredy tried diff -Nurd (so an additional d flag) but that did
not make a difference).

Frans.


