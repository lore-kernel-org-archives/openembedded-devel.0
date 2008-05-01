Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JrNGb-0004I0-04
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 May 2008 03:07:21 +0200
Received: by an-out-0708.google.com with SMTP id b38so145746ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2008 18:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=4iGNZKf7IPlyj6DUBRWhtyx7uI9HMy/hgTQpY8vPQOQ=;
	b=Y/nDMd73Z+mxyJ1qTw8cnqcixbL+hJNKreMb289IaUcYZ4jTcMpAUFXBnlc5F004nwv5Ez/HDDovnDpO4N2DR+Hq/72qEKFtD1whdwbUGt2W7NDWLo4H4z+toumFB63oAGJlWt1F7N8hgx8grkYn6iDmY4rAA7Mw5rerIAEz4A4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=YUoYpkoK7jpzs2hurYN3Dhk4ENIHISc5oOiW3YvC4RMfZ9438lAruCgIL8tj/DKqlW26V7CVJ4hy+iLjqsU9T/n8HZy+OsUvu5JOX+Yzzxg7MmJmB6VGCMY9Q6qKEtl2r6oIJgb89NEGE5H+uvCKf9PREvU6pL031/2XO5kR9+I=
Received: by 10.100.209.11 with SMTP id h11mr2335665ang.83.1209604007371;
	Wed, 30 Apr 2008 18:06:47 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Wed, 30 Apr 2008 18:06:47 -0700 (PDT)
Message-ID: <c384c5ea0804301806t6ac98b0cv63a9520fa9c93f5d@mail.gmail.com>
Date: Thu, 1 May 2008 03:06:47 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: [RFC] Use 5 or 10 seconds global time-out on wget fetch command (--timeout 5)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 01 May 2008 01:07:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I would like to propose a global 5 or maybe 10 seconds time-out being
added to the wget command in conf/bitbake.conf.
There are already 5 retries configured, so it should still be robust.

It avoids those minute long stalls when a URI is simply not responding.

In my last 10 completely fresh (no downloads/) builds in the last
month, these long time-outs happened on me 9 out of 10 times at some
package.

Objections?

Regards,
-- 
Leon


