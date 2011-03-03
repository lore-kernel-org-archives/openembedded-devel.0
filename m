Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PvDbB-0005WT-SR
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 19:50:06 +0100
Received: by iwn10 with SMTP id 10so1315530iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2011 10:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=Iwr9bDrCA9iOkU/IE40P7dGWKKpW6DKMbTudlyigISc=;
	b=LsqjeAirY5/ErDwNE5dV6oo9WQADsSZIS35t4NPHQtpL1QTX0mjhxfm7VwFXXwPH/0
	EYrW/stZ2t/Ww52Z9nyKJPS7nFCjLcI4nUhEvTCM+M/Q/6WyKG97RPmZbV05jH6Ip9KP
	5h8rfpXqq1UG3acyvJDjj4BMxlSkeMgZTXoNU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=nZGa82jSy2w//gLQxVcLoxWMcwKib8ky6bhpcHUoMX64CqvV0nLiQ4KZdsDeTUXh1n
	nsKzdhkqDiMehHPvgJIrwIabJCiqTg27xoCSBAwf1eLzXRbAchxEV80upxkQcBfSR5Ir
	ljW/F+7jAP+Aadup8xjsikTHjiJ8tegJJKqp0=
MIME-Version: 1.0
Received: by 10.231.191.129 with SMTP id dm1mr1154676ibb.173.1299178110490;
	Thu, 03 Mar 2011 10:48:30 -0800 (PST)
Received: by 10.231.11.201 with HTTP; Thu, 3 Mar 2011 10:48:30 -0800 (PST)
Date: Thu, 3 Mar 2011 19:48:30 +0100
Message-ID: <AANLkTinrZHXCyA2USHeuOijx0KrZrNVY7K3uhqwpLaao@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: gcc ICE (gcc 4.1.2, nios2), test program included
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
X-List-Received-Date: Thu, 03 Mar 2011 18:50:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I've bumped onto an issue that I seem unable to resolv.
With gcc 4.1.2, target nios2, I get an ICE when compiling dbus:

I've reduced the failing program to a 16 line test program (using
repeated calls to delta and some hand reduction):

typedef struct DBusCredentials DBusCredentials;
typedef struct { } DBusAuthStateData;
typedef struct
{
  const DBusAuthStateData *state;
  DBusCredentials *authorized_identity;
} DBusAuth;
static const DBusAuthStateData common_state_authenticated = { };
_dbus_auth_set_credentials (DBusAuth *auth)
{
    if (auth->state == &common_state_authenticated)
    {
      return auth->authorized_identity;
    }
    return auth->authorized_identity;
}

This gives (when compiled):

frans@frans-desktop:/tmp$
/home/frans/workspace/tmp/sysroots/x86_64-linux/usr/nios2/bin/nios2-linux-gcc
-fPIC -O2 -o tst.o tst.c
tst.c: In function '_dbus_auth_set_credentials':
tst.c:13: warning: return makes integer from pointer without a cast
tst.c:15: warning: return makes integer from pointer without a cast
tst.c:16: error: Attempt to delete prologue/epilogue insn:
(insn 55 54 56 0 (set:SI (reg:SI 22 r22)
        (mem/c:SI (plus:SI (reg/f:SI 27 sp)
                (const_int 0 [0x0])) [6 S4 A32])) -1 (nil)
    (nil))
tst.c:16: internal compiler error: in propagate_one_insn, at flow.c:1699
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.


Anyone an idea on how to tackle this.

BTW: this applies with the nios code for gcc in OE, I have also tried
it with the latest altera version and I get the same problem.

Best regards, Frans.


