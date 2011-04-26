Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QEikj-000338-BB
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 15:56:33 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p3QDrvIk006323
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 15:53:58 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Tue, 26 Apr 2011 15:53:57 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1303814494-9623-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1303824912.4073.44.camel@mattotaupa>
Date: Tue, 26 Apr 2011 15:53:56 +0200
In-Reply-To: <1303824912.4073.44.camel@mattotaupa> (Paul Menzel's message of
	"Tue, 26 Apr 2011 15:35:12 +0200")
Message-ID: <ly1v0pqft7.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -1.3
X-Spam-Level: -
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Subject: Re: [PATCH] tcp-wrappers: place LIBS after object files
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
X-List-Received-Date: Tue, 26 Apr 2011 13:56:33 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Paul Menzel <paulepanter@users.sourceforge.net> writes:

>> From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
>
> it seems you need to update your Git configuration to your common
> email address.

Both addresses are in use; some patches are created at home when I work
on a personal project (-> tu-chemnitz.de address), some patches at work
(-> sigma-chemnitz.de address).


> The diff could have been smaller, but no big problem.

how? three places must be changed (removal of $(LIBS) from old LINKFLAGS,
removal of superflous ';' and adding of $(LIBS) to link command).


>> +-SHLIB_OBJ=3D $(addprefix shared/, $(LIB_OBJ));
>> ++SHLIB_OBJ=3D $(addprefix shared/, $(LIB_OBJ))
>
> The =BB;=AB was superfluous, since no command followed?

yes; and it would break the build because it terminates the $(CC) command
and $(LIBS) would be interpreted as the start of a new command.

>> ++	$(CC) $(LDFLAGS) -o $(SHLIB) $(SHLINKFLAGS) $(SHLIB_OBJ) $(LIBS)


> Is this patch already upstream?

woglinde gave his ack on irc and I submitted it.



Enrico


