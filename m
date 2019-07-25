Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id 00D726B512
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 14:18:51 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id r21so36574568qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IXzo1oXF83cQgH4NDQ31FLBntJSqqi17aQbX0IWvuBY=;
	b=H6ls8hu8argrq687HEJP5YDuWQVE8AxD9/abHu+1a8DogWPhNika98w5eznZkAeDJk
	nNtWv3R5Pe4UG07CLCVXaLRLqXKkgZi0olaw801bXqaHVA1xVL2/BsCBMD8yEqec5lvu
	YCPQTJ8Jns8pf8SgPrECFBJMNYDLPgTTINCtHGRhS3cDXwrtBY9TTe0YPklntEo5d+St
	KVkaULUxHg3BjtiuOJY3caaCdHdlK1DT69XByn7DLZzUaJVWWbOYi3Fx6jDoU+5JSbmJ
	OlpyQg5ZQmpuJjsZR5qqhAVGh6n+15IeXzzp3L3WGB1B+RplZc5aA2g4+nyG+Husj/SV
	4b/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IXzo1oXF83cQgH4NDQ31FLBntJSqqi17aQbX0IWvuBY=;
	b=EeI7TvMF2zV0vqv40mbJ/dAKqvP2dWtvS/Y3z6qjmeWVgM4U/XJUoACJVVZ3SNsV2N
	BZUzDYe7QUjTup/W5ZMW97vFbNBwRmPrm5GBv4HroLwOMLxn21QrJapl3kZl4QvDFaYL
	DOLMAIj4yJNQlxjx5Vo4gQqhppYtwxhE1t4x8h/Cce+yM4/Eajq7vM07JJDeFnac2utR
	A/hV69q1dkkkQyK1kfO4lXPfVj+gkZu5xSa2nV9b65HbioJ3EJNoKMtU90SI93sYUTCA
	DWzjyO+1DeQqE+ndqQyJ91sQeMz/cJ+I2XsJLr30PF6Srz06Hzdd9frwEHpMU1E+fWSO
	Z7KA==
X-Gm-Message-State: APjAAAVsVYJG7/To2x2h6jZoyAt40sgei/mhaCAshlaN8FrcKsrOqieD
	2Rxgq8ZJO6M69wL4ONwgTzEImyrgnuQXwIgKvGs=
X-Google-Smtp-Source: APXvYqwVoVXO+kmAYdpaph3q2ck1qr/ll7CrbQTpXEa8BVi4qsPGMgUdHVB+xTR+1z6bfKZwaE3EYxNUs8MdWQJm4Vg=
X-Received: by 2002:a37:7083:: with SMTP id l125mr56629919qkc.71.1564064331743;
	Thu, 25 Jul 2019 07:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190724145100.88293-1-psaavedra@igalia.com>
	<20190724145100.88293-6-psaavedra@igalia.com>
	<CAMKF1spqDHAa4bOgqDLckGwvc6DYoqi9rqN7TJ+hARa=bR9eGw@mail.gmail.com>
In-Reply-To: <CAMKF1spqDHAa4bOgqDLckGwvc6DYoqi9rqN7TJ+hARa=bR9eGw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Jul 2019 07:18:35 -0700
Message-ID: <CAMKF1soAQj4w1M4vSnSw5hMx-XxuPx0__UM4tWbbqqKMpE=ufQ@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH v5 6/7] ibus-table-chinese: add ibus-table-chinese recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jul 2019 14:18:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

adding 0004-skip-ibus-table-createdb.patch solved the configure issue
but then install fails

| CMake Error at tables/array/cmake_install.cmake:49 (file):
|   file INSTALL cannot find
|   "/mnt/a/yoe/build/tmp/work/aarch64-yoe-linux-musl/ibus-table-chinese/1.=
8.2-r0/build/tables/array/array30.db".

On Thu, Jul 25, 2019 at 7:01 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> this fails
>
> -- Checking for module 'ibus-table>=3D1.2'
> --   Found ibus-table, version 1.9.21
> CMake Error at tables/CMakeLists.txt:3 (MESSAGE):
> ibus-table-createdb is not installed
>
> On Wed, Jul 24, 2019 at 7:59 AM Pablo Saavedra <psaavedra@igalia.com> wro=
te:
> >
> > Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> > ---
> >  .../0001-revert-CMakeLists.txt.patch               |  204 ++
> >  .../ibus/ibus-table-chinese/0002-add-Modules.patch | 2933 ++++++++++++=
++++++++
> >  .../0003-add-ChangeLog.prev.patch                  |   58 +
> >  .../0005-fix-cmake-cross-compile.patch             |  130 +
> >  .../ibus/ibus-table-chinese_1.8.2.bb               |   82 +
> >  5 files changed, 3407 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/ibus/ibus-table-chinese/000=
1-revert-CMakeLists.txt.patch
> >  create mode 100644 meta-oe/recipes-support/ibus/ibus-table-chinese/000=
2-add-Modules.patch
> >  create mode 100644 meta-oe/recipes-support/ibus/ibus-table-chinese/000=
3-add-ChangeLog.prev.patch
> >  create mode 100644 meta-oe/recipes-support/ibus/ibus-table-chinese/000=
5-fix-cmake-cross-compile.patch
> >  create mode 100644 meta-oe/recipes-support/ibus/ibus-table-chinese_1.8=
.2.bb
> >
> > diff --git a/meta-oe/recipes-support/ibus/ibus-table-chinese/0001-rever=
t-CMakeLists.txt.patch b/meta-oe/recipes-support/ibus/ibus-table-chinese/00=
01-revert-CMakeLists.txt.patch
> > new file mode 100644
> > index 000000000..d677dc49a
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/ibus/ibus-table-chinese/0001-revert-CMake=
Lists.txt.patch
> > @@ -0,0 +1,204 @@
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -1,17 +1,20 @@
> > + cmake_minimum_required(VERSION 2.6.2)
> > +
> > +-# Included scripts do automatic cmake_policy PUSH and POP.
> > +-# OLD: CMake policy in included script will affect the invoker.
> > +-# CMAKE_POLICY(SET CMP0011 OLD)
> > ++# CMP0011 should be set here, otherwise policy set in module won't af=
fect
> > ++# here.
> > ++CMAKE_POLICY(SET CMP0011 OLD)
> > +
> > + # Default CMAKE_INSTALL_PREFIX should be set before PROJECT()
> > + SET(CMAKE_INSTALL_PREFIX "/usr" CACHE PATH "Install dir prefix")
> > +
> > + # Whether to build on fedora
> > +-SET(CMAKE_FEDORA_ENABLE_FEDORA_BUILD "1" CACHE STRING "Enable fedora =
build")
> > ++SET(CMAKE_FEDORA_ENABLE_FEDORA_BUILD "0" CACHE STRING "Enable fedora =
build")
> > +
> > +-# Message level INFO1 (5)
> > +-SET(MANAGE_MESSAGE_LEVEL 5 CACHE STRING "Message (Verbose) Level")
> > ++# Message level M_OFF (4)
> > ++SET(MANAGE_MESSAGE_LEVEL 4 CACHE STRING "Message (Verbose) Level")
> > ++
> > ++# Default support Gnome shell
> > ++SET(GNOME_SHELL 1)
> > +
> > + ####################################################################
> > + # Project specific information
> > +@@ -19,34 +22,20 @@
> > + PROJECT(ibus-table-chinese NONE)
> > + SET(PRJ_SUMMARY "Chinese input tables for IBus")
> > +
> > +-SET(SUMMARY_TRANSLATIONS
> > +-    "zh_CN" "=E4=B8=AD=E6=96=87=E7=A0=81=E8=A1=A8=E8=BE=93=E5=85=A5=
=E6=B3=95"
> > +-    "zh_TW" "=E4=B8=AD=E6=96=87=E7=A2=BC=E8=A1=A8=E8=BC=B8=E5=85=A5=
=E6=B3=95"
> > +-    )
> > +-
> > + SET(PRJ_DESCRIPTION
> > + "ibus-table-chinese is provides the infrastructure for Chinese input =
methods.
> > + Input tables themselves are in subpackages."
> > +     )
> > +
> > +-SET(DESCRIPTION_TRANSLATIONS
> > +-    "zh_TW" "ibus-table-chinese =E6=8F=90=E4=BE=9B=E4=BA=86=E4=B8=AD=
=E6=96=87=E7=A2=BC=E8=A1=A8=E8=BC=B8=E5=85=A5=E6=B3=95=E7=9A=84=E5=9F=BA=E7=
=A4=8E=E6=9E=B6=E6=A7=8B=E3=80=82
> > +-    =E8=BC=B8=E5=85=A5=E6=B3=95=E6=9C=AC=E8=BA=AB=E5=89=87=E5=9C=A8=
=E5=AD=90=E5=A5=97=E4=BB=B6=E8=A3=A1=E3=80=82"
> > +-    )
> > +-
> > + SET(AUTHORS "Yuwei Yu, Caius 'kaio' Chance, Ding-Yi Chen")
> > + SET(MAINTAINER "Ding-Yi Chen <dchen@redhat.com>")
> > + SET(VENDOR "Red Hat, Inc")
> > + SET(LICENSE "GPLv3+")
> > +-SET(PRJ_GROUP "System Environment/Libraries")
> > +-SET(BUILD_ARCH "noarch")
> > +-SET(RPM_SPEC_URL "http://code.google.com/p/ibus/")
> > +-SET(RPM_SPEC_SOURCES "https://fedorahosted.org/releases/c/m/%{name}/%=
{name}-%{version}-Source.tar.gz")
> > +
> > + ####################################################################
> > + # Includes
> > + #
> > +-LIST(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_SOURCE_DIR}/Modules)
> > ++SET(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/Modules ${CMAKE_ROOT}/Modul=
es )
> > +
> > + # Create a link if Modules/ does not exists
> > + IF(EXISTS ${CMAKE_SOURCE_DIR}/cmake-fedora/Modules)
> > +@@ -63,6 +52,7 @@
> > +       SET(LIB_DIR "${CMAKE_INSTALL_PREFIX}/lib" CACHE PATH "Library d=
ir")
> > +     ENDIF(CMAKE_SYSTEM_PROCESSOR MATCHES "64")
> > +     SET(LIBEXEC_DIR "${LIB_DIR}" CACHE PATH "LIBEXEC dir")
> > ++    MESSAGE("*Hi")
> > + ENDIF(NOT CMAKE_FEDORA_ENABLE_FEDORA_BUILD)
> > +
> > + INCLUDE(ManageEnvironment RESULT_VARIABLE MANAGE_ENVIRONMENT_PATH)
> > +@@ -77,56 +67,82 @@
> > +
> > + INCLUDE(ManageVersion)
> > + RELEASE_NOTES_READ_FILE()
> > +-INCLUDE(ManageArchive)
> > +-INCLUDE(ManageFile)
> > +-INCLUDE(ManageSourceVersionControl)
> > +-INCLUDE(ManageTarget)
> > +-INCLUDE(ManageTranslation)
> > + INCLUDE(ManageUninstall)
> > +-ENABLE_TESTING()
> > +
> > + ####################################################################
> > +-# Dependencies
> > ++# Required
> > + #
> > +
> > +-INCLUDE(ManageDependency)
> > +-## Requires
> > +-MANAGE_DEPENDENCY(REQUIRES IBUS-TABLE VER "1.2.0" REQUIRED)
> > +-
> > +-## Build Requires
> > +-MANAGE_DEPENDENCY(BUILD_REQUIRES CMAKE VER "2.6.2" REQUIRED)
> > +-MANAGE_DEPENDENCY(BUILD_REQUIRES IBUS-TABLE VER "1.2.0" REQUIRED DEVE=
L)
> > +-PRJ_INFO_CMAKE_APPEND(${PRJ_INFO_CMAKE} REQUIRES)
> > +-PRJ_INFO_CMAKE_APPEND(${PRJ_INFO_CMAKE} BUILD_REQUIRES)
> > ++FIND_PACKAGE(PkgConfig)
> > ++PKG_CHECK_MODULES(IBUS_TABLE REQUIRED ibus-table>=3D1.2)
> > +
> > + ####################################################################
> > + # Building
> > + #
> > ++
> > + ADD_SUBDIRECTORY(tables)
> > +
> > + ####################################################################
> > + # Installing
> > + #
> > +
> > +-MANAGE_SOURCE_VERSION_CONTROL_GIT()
> > ++# Install docs
> > ++# Note: Need to use filename only, otherwise
> > ++# ${CMAKE_SOURCE_DIR}/RELEASE-NOTES.txt will be deleted in spec
> > ++#
> > ++
> > ++GET_FILENAME_COMPONENT(_releaseFileName "${RELEASE_FILE}" NAME)
> > ++SET(INSTALL_DOCS ${_releaseFileName} AUTHORS README ChangeLog COPYING=
 README)
> > ++STRING_JOIN(PRJ_DOC_LIST " " ${INSTALL_DOCS})
> > ++
> > ++INSTALL(FILES ${INSTALL_DOCS}
> > ++    DESTINATION "${PRJ_DOC_DIR}")
> > +
> > +-INSTALL(FILES AUTHORS README ChangeLog COPYING DESTINATION ${PRJ_DOC_=
DIR})
> > ++####################################################################
> > ++# Source Version Control
> > ++#
> > ++INCLUDE(ManageSourceVersionControl)
> > ++MANAGE_SOURCE_VERSION_CONTROL_GIT()
> > +
> > + ####################################################################
> > + # Packing
> > + #
> > ++INCLUDE(ManageArchive)
> > +
> > +-## Pack Source
> > +-SET(SOURCE_ARCHIVE_DIR ${CMAKE_BINARY_DIR}/SOURCES CACHE PATH "Source=
 Archive Dir")
> > +-PACK_SOURCE_ARCHIVE("${SOURCE_ARCHIVE_DIR}"
> > +-    GITIGNORE ${CMAKE_SOURCE_DIR}/.gitignore
> > ++IF(CMAKE_FEDORA_ENABLE_FEDORA_BUILD)
> > ++    INCLUDE(ManageRPM)
> > ++    INCLUDE(ManageReleaseFedora)
> > ++ENDIF(CMAKE_FEDORA_ENABLE_FEDORA_BUILD)
> > ++INCLUDE(ManageRelease)
> > ++
> > ++SET(PRJ_IGNORE_FILES_COMMON
> > ++    "/doc/"  "\\\\.spec$" "messages.po$" "\\\\.orig$" "/cmake-fedora/=
"
> > ++    "/\\\\.cache/"
> > ++    "\\\\.db$"
> > ++    )
> > ++
> > ++LIST(APPEND PRJ_IGNORE_FILES_COMMON
> > ++    "\\\\.utf8$" "\\\\.tmp$" "\\\\.freq$" "\\\\.tab$"
> > ++    "tables/array/.*\\\\.head$"
> > ++    "array30.txt" "array30-big.txt" "wubi-haifeng86.txt"
> > +     )
> > +
> > +-## Pack RPM
> > ++LIST(APPEND SOURCE_ARCHIVE_IGNORE_FILES
> > ++    ${PRJ_IGNORE_FILES_COMMON} "/bin/" "\\\\.xml$" "\\\\.schemas")
> > ++
> > ++IF(RPM_BUILD_SOURCES)
> > ++    SET(SOURCE_ARCHIVE_DIR ${RPM_BUILD_SOURCES})
> > ++ELSE(RPM_BUILD_SOURCES)
> > ++    SET(SOURCE_ARCHIVE_DIR ${CMAKE_BINARY_DIR}/SOURCES)
> > ++ENDIF(RPM_BUILD_SOURCES)
> > ++
> > ++PACK_SOURCE_ARCHIVE("${SOURCE_ARCHIVE_DIR}")
> > + IF(CMAKE_FEDORA_ENABLE_FEDORA_BUILD)
> > +-    SET(RPM_BUILD_SOURCES ${SOURCE_ARCHIVE_DIR})
> > +-    INCLUDE(ManageRPM)
> > +-    PACK_RPM(SPEC_IN "SPECS/project.spec.in")
> > ++    PACK_RPM()
> > ++    RELEASE_FEDORA(fedora el6)
> > ++    # "Off" Warning is displayed if mock is not installed.
> > ++    RPM_MOCK_BUILD()
> > ++    MANAGE_RELEASE(release_fedora)
> > + ENDIF(CMAKE_FEDORA_ENABLE_FEDORA_BUILD)
> > +
> > + ####################################################################
> > +@@ -142,20 +158,10 @@
> > + #MANAGE_UPLOAD_CMD(scp src UPLOAD_FILES ${SOURCE_ARCHIVE_FILE})
> > + #ADD_DEPENDENCIES(upload upload_src)
> > +
> > +-INCLUDE(ManageRelease)
> > +-IF(CMAKE_FEDORA_ENABLE_FEDORA_BUILD)
> > +-    INCLUDE(ManageReleaseFedora)
> > +-    RELEASE_FEDORA(fedora el6)
> > +-    # "Off" Warning is displayed if mock is not installed.
> > +-    MANAGE_RELEASE(tag_push release_fedora)
> > +-ELSE(CMAKE_FEDORA_ENABLE_FEDORA_BUILD)
> > +-    MANAGE_RELEASE(tag_push)
> > +-ENDIF(CMAKE_FEDORA_ENABLE_FEDORA_BUILD)
> > +-
> > +-
> > + ####################################################################
> > + # Test Suites.
> > + #
> > ++#ENABLE_TESTING()
> > + #ADD_TEST("Test" test_cmd1)
> > +
> > +
> > diff --git a/meta-oe/recipes-support/ibus/ibus-table-chinese/0002-add-M=
odules.patch b/meta-oe/recipes-support/ibus/ibus-table-chinese/0002-add-Mod=
ules.patch
> > new file mode 100644
> > index 000000000..ffacda683
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/ibus/ibus-table-chinese/0002-add-Modules.=
patch
> > @@ -0,0 +1,2933 @@
> > +--- /dev/null
> > ++++ b/Modules/DateTimeFormat.cmake
> > +@@ -0,0 +1,37 @@
> > ++# - Date/time format module.
> > ++#
> > ++# Included by:
> > ++#   ManageVersion
> > ++#
> > ++# Defines the following macros:
> > ++#    TODAY(date_var format [locale])
> > ++#      - Get date of today in specified format and locale.
> > ++#        * Parameters:
> > ++#                date_var: Result date string
> > ++#          format: date format for date(1)
> > ++#          locale: locale of the string. Use current locale setting i=
f
> > ++#            locale is not given.
> > ++#
> > ++# Provides the following variables:
> > ++#    TODAY_CHANGELOG: Today in the format that is used in RPM Changel=
og.
> > ++#     e.g. Wed 08 Aug 2010
> > ++#
> > ++#    TODAY_SHORT: Short presentation of today, e.g. 20100818.
> > ++#
> > ++
> > ++IF(NOT DEFINED _DATE_TIME_FORMAT_CMAKE_)
> > ++    SET(_DATE_TIME_FORMAT_CMAKE_ "DEFINED")
> > ++
> > ++    MACRO(TODAY date_var format)
> > ++      INCLUDE(ManageVariable)
> > ++      SET(_locale ${ARGV2})
> > ++      IF(_locale)
> > ++          SET(ENV{LC_ALL} ${_locale})
> > ++      ENDIF(_locale)
> > ++      COMMAND_OUTPUT_TO_VARIABLE(${date_var} date --utc "${format}")
> > ++    ENDMACRO(TODAY date_var format)
> > ++
> > ++    TODAY(TODAY_CHANGELOG "+%a %b %d %Y" "C")
> > ++    TODAY(TODAY_SHORT "+%Y%m%d" "C")
> > ++ENDIF(NOT DEFINED _DATE_TIME_FORMAT_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageAPIDoc.cmake
> > +@@ -0,0 +1,50 @@
> > ++# - Mage generated API documents
> > ++# This module is for API document generation, such as doxygen.
> > ++# Defines following macros:
> > ++#   MANAGE_APIDOC_DOXYGEN(doxygen_in doc_dir)
> > ++#   - This macro generate documents according to doxygen template.
> > ++#     Arguments:
> > ++#     + doxygen_in: Doxygen template file.
> > ++#     + doc_dir: Document source directory to be copied from.
> > ++#     Reads following variable:
> > ++#     + PRJ_DOC_DIR: Directory for document
> > ++#
> > ++#
> > ++IF(NOT DEFINED _MANAGE_APIDOC_CMAKE_)
> > ++    SET(_MANAGE_APIDOC_CMAKE_ "DEFINED")
> > ++    INCLUDE(ManageMessage)
> > ++
> > ++    MACRO(MANAGE_APIDOC_DOXYGEN doxygen_in doc_dir)
> > ++      SET(SOURCE_ARCHIVE_IGNORE_FILES ${SOURCE_ARCHIVE_IGNORE_FILES} =
"/Doxyfile$")
> > ++      SET(_manage_apidoc_doxygen_dependency_missing 0)
> > ++      IF(NOT PRJ_DOC_DIR)
> > ++          M_MSG(${M_OFF} "PRJ_DOC_DIR undefined. Doxygen support disa=
bled.")
> > ++          SET(_manage_apidoc_doxygen_dependency_missing 1)
> > ++      ENDIF(NOT PRJ_DOC_DIR)
> > ++
> > ++      FIND_PACKAGE(doxygen)
> > ++      IF(NOT PACKAGE_FOUND_NAME)
> > ++          M_MSG(${M_OFF} "Package doxygen not found. Doxygen support =
disabled.")
> > ++          SET(_manage_apidoc_doxygen_dependency_missing 1)
> > ++      ENDIF(NOT PACKAGE_FOUND_NAME)
> > ++
> > ++      FIND_PROGRAM(DOXYGEN_CMD doxygen)
> > ++      IF(DOXYGEN_CMD STREQUAL "DOXYGEN_CMD-NOTFOUND")
> > ++          M_MSG(${M_OFF} "Program doxygen not found. Doxygen support =
disabled.")
> > ++          SET(_manage_apidoc_doxygen_dependency_missing 1)
> > ++      ENDIF(DOXYGEN_CMD STREQUAL "DOXYGEN_CMD-NOTFOUND")
> > ++
> > ++      IF(NOT _manage_apidoc_doxygen_dependency_missing)
> > ++          CONFIGURE_FILE(${doxygen_in} Doxyfile)
> > ++
> > ++          ADD_CUSTOM_TARGET(doxygen
> > ++              COMMAND "${DOXYGEN_CMD}" "Doxyfile"
> > ++              )
> > ++
> > ++          INSTALL(DIRECTORY ${doc_dir}
> > ++              DESTINATION "${PRJ_DOC_DIR}"
> > ++              )
> > ++      ENDIF(NOT _manage_apidoc_doxygen_dependency_missing)
> > ++    ENDMACRO(MANAGE_APIDOC_DOXYGEN doxygen_template)
> > ++ENDIF(NOT DEFINED _MANAGE_APIDOC_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageArchive.cmake
> > +@@ -0,0 +1,179 @@
> > ++# - Pack source helper module
> > ++# By default CPack pack everything under the source directory, this i=
s usually
> > ++# undesirable. We avoid this by using the sane default ignore list.
> > ++#
> > ++# Includes:
> > ++#   ManageVersion
> > ++#   CPack
> > ++#
> > ++# Included by:
> > ++#   ManageRPM
> > ++#
> > ++# Read and Defines following variable:
> > ++#   SOURCE_ARCHIVE_IGNORE_FILES_DEFAULT: Default list of file pattern=
s
> > ++#     that are normally exclude from the source package.
> > ++#     Override it by setting it before INCLUDE(ManageArchive).
> > ++# Defines following target:
> > ++#     pack_remove_old: Remove old source package files.
> > ++# Defines following macro:
> > ++#   SOURCE_ARCHIVE(outputDir [generator])
> > ++#   - Pack source files as <projectName>-<PRJ_VER>-Source.<packFormat=
>,
> > ++#     Arguments:
> > ++#     + outputDir: Directory to write source archive.
> > ++#     + generator: (Optional) Method to make archive. Basically this =
argument
> > ++#       is passed as CPACK_GENERATOR. Default to TGZ.
> > ++#     Read following variables:
> > ++#     + PROJECT_NAME: Project name
> > ++#     + VENDOR: Organization that issue this project.
> > ++#     + PRJ_VER: Project version
> > ++#     + PRJ_SUMMARY: (Optional) Project summary
> > ++#     + SOURCE_ARCHIVE_IGNORE_FILES: A list of regex filename pattern
> > ++#       that should be excluded from source archive file.
> > ++#       (SOURCE_ARCHIVE_IGNORE_FILE_CMAKE) is already in this list.
> > ++#     Define following variables:
> > ++#     + SOURCE_ARCHIVE_CONTENTS: List of files to be packed to archiv=
e.
> > ++#     + SOURCE_ARCHIVE_FILE_EXTENSION: File extension of the source p=
ackage
> > ++#       files.
> > ++#     + SOURCE_ARCHIVE_NAME: Name of source archive (without path)
> > ++#     + SOURCE_ARCHIVE_FILE: Path to source archive file
> > ++#     Target:
> > ++#     + pack_src: Pack source files like package_source.
> > ++#     + clean_pack_src: Remove all source archives.
> > ++#     + clean_old_pack_src: Remove all old source package.
> > ++#
> > ++#
> > ++IF(NOT DEFINED _MANAGE_ARCHIVE_CMAKE_)
> > ++    SET (_MANAGE_ARCHIVE_CMAKE_ "DEFINED")
> > ++    SET(SOURCE_ARCHIVE_IGNORE_FILES_DEFAULT
> > ++      "/\\\\.svn/"  "/CVS/" "/\\\\.git/"  "\\\\.gitignore$" "/\\\\.hg=
/"
> > ++      "/\\\\.hgignore$"
> > ++      "~$" "\\\\.swp$" "\\\\.log$" "\\\\.bak$" "\\\\.old$"
> > ++      "\\\\.gmo$" "\\\\.cache$"
> > ++      "\\\\.tar.gz$" "\\\\.tar.bz2$" "/src/config\\\\.h$" "NO_PACK")
> > ++
> > ++    SET(SOURCE_ARCHIVE_IGNORE_FILES_CMAKE "/CMakeFiles/" "_CPack_Pack=
ages/" "/Testing/"
> > ++      "\\\\.directory$" "CMakeCache\\\\.txt$"
> > ++      "/install_manifest.txt$"
> > ++      "/cmake_install\\\\.cmake$" "/cmake_uninstall\\\\.cmake$""/CPac=
k.*\\\\.cmake$" "/CTestTestfile\\\\.cmake$"
> > ++      "Makefile$" "/${PROJECT_NAME}-${PRJ_VER}-SOURCE/"
> > ++      )
> > ++
> > ++    LIST(APPEND SOURCE_ARCHIVE_IGNORE_FILES ${SOURCE_ARCHIVE_IGNORE_F=
ILES_DEFAULT} ${SOURCE_ARCHIVE_IGNORE_FILES_CMAKE})
> > ++
> > ++    INCLUDE(ManageVersion)
> > ++
> > ++    # Internal:  SOURCE_ARCHIVE_GET_CONTENTS()
> > ++    #   - Return all source file to be packed.
> > ++    #     This is called by SOURCE_ARCHIVE(),
> > ++    #     So no need to call it again.
> > ++    FUNCTION(SOURCE_ARCHIVE_GET_CONTENTS )
> > ++      SET(_fileList "")
> > ++      FILE(GLOB_RECURSE _ls "*")
> > ++      STRING(REPLACE "\\\\" "\\" _ignore_files "${SOURCE_ARCHIVE_IGNO=
RE_FILES}")
> > ++      FOREACH(_file ${_ls})
> > ++          SET(_matched 0)
> > ++          FOREACH(filePattern ${_ignore_files})
> > ++              M_MSG(${M_INFO3} "_file=3D${_file} filePattern=3D${file=
Pattern}")
> > ++              IF(_file MATCHES "${filePattern}")
> > ++                  SET(_matched 1)
> > ++                  BREAK()
> > ++              ENDIF(_file MATCHES "${filePattern}")
> > ++          ENDFOREACH(filePattern ${_ignore_files})
> > ++          IF(NOT _matched)
> > ++              FILE(RELATIVE_PATH _file ${CMAKE_SOURCE_DIR} "${_file}"=
)
> > ++              LIST(APPEND _fileList "${_file}")
> > ++          ENDIF(NOT _matched)
> > ++      ENDFOREACH(_file ${_ls})
> > ++      SET(SOURCE_ARCHIVE_CONTENTS ${_fileList} CACHE STRING "Source a=
rchive file list" FORCE)
> > ++      M_MSG(${M_INFO2} "SOURCE_ARCHIVE_CONTENTS=3D${SOURCE_ARCHIVE_CO=
NTENTS}")
> > ++    ENDFUNCTION(SOURCE_ARCHIVE_GET_CONTENTS var)
> > ++
> > ++    MACRO(PACK_SOURCE_ARCHIVE outputDir)
> > ++      IF(PRJ_VER STREQUAL "")
> > ++          M_MSG(${M_FATAL} "PRJ_VER not defined")
> > ++      ENDIF(PRJ_VER STREQUAL "")
> > ++      IF(${ARGV2})
> > ++          SET(CPACK_GENERATOR "${ARGV2}")
> > ++      ELSE(${ARGV2})
> > ++          SET(CPACK_GENERATOR "TGZ")
> > ++      ENDIF(${ARGV2})
> > ++      SET(CPACK_SOURCE_GENERATOR ${CPACK_GENERATOR})
> > ++      IF(${CPACK_GENERATOR} STREQUAL "TGZ")
> > ++          SET(SOURCE_ARCHIVE_FILE_EXTENSION "tar.gz")
> > ++      ELSEIF(${CPACK_GENERATOR} STREQUAL "TBZ2")
> > ++          SET(SOURCE_ARCHIVE_FILE_EXTENSION "tar.bz2")
> > ++      ELSEIF(${CPACK_GENERATOR} STREQUAL "ZIP")
> > ++          SET(SOURCE_ARCHIVE_FILE_EXTENSION "zip")
> > ++      ENDIF(${CPACK_GENERATOR} STREQUAL "TGZ")
> > ++
> > ++      SET(CPACK_SOURCE_IGNORE_FILES ${SOURCE_ARCHIVE_IGNORE_FILES})
> > ++      SET(CPACK_PACKAGE_VERSION ${PRJ_VER})
> > ++
> > ++      IF(EXISTS ${CMAKE_SOURCE_DIR}/COPYING)
> > ++          SET(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_SOURCE_DIR}/README)
> > ++      ENDIF(EXISTS ${CMAKE_SOURCE_DIR}/COPYING)
> > ++
> > ++      IF(EXISTS ${CMAKE_SOURCE_DIR}/README)
> > ++          SET(CPACK_PACKAGE_DESCRIPTION_FILE ${CMAKE_SOURCE_DIR}/READ=
ME)
> > ++      ENDIF(EXISTS ${CMAKE_SOURCE_DIR}/README)
> > ++
> > ++      IF(DEFINED PRJ_SUMMARY)
> > ++          SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "${PRJ_SUMMARY}")
> > ++      ENDIF(DEFINED PRJ_SUMMARY)
> > ++
> > ++      SET(CPACK_SOURCE_PACKAGE_FILE_NAME "${PROJECT_NAME}-${PRJ_VER}-=
Source")
> > ++      SET(SOURCE_ARCHIVE_NAME "${CPACK_SOURCE_PACKAGE_FILE_NAME}.${SO=
URCE_ARCHIVE_FILE_EXTENSION}" CACHE STRING "Source archive name" FORCE)
> > ++      SET(SOURCE_ARCHIVE_FILE "${outputDir}/${SOURCE_ARCHIVE_NAME}" C=
ACHE FILEPATH "Source archive file" FORCE)
> > ++
> > ++      SET(CPACK_PACKAGE_VENDOR "${VENDOR}")
> > ++      SOURCE_ARCHIVE_GET_CONTENTS()
> > ++
> > ++      SET(SOURCE_ARCHIVE_CONTENTS_ABSOLUTE "")
> > ++      FOREACH(_file ${SOURCE_ARCHIVE_CONTENTS})
> > ++          LIST(APPEND SOURCE_ARCHIVE_CONTENTS_ABSOLUTE "${CMAKE_HOME_=
DIRECTORY}/${_file}")
> > ++      ENDFOREACH(_file ${SOURCE_ARCHIVE_CONTENTS})
> > ++
> > ++      INCLUDE(CPack)
> > ++
> > ++      # Get relative path of outputDir
> > ++      FILE(RELATIVE_PATH _outputDir_rel ${CMAKE_BINARY_DIR} ${outputD=
ir})
> > ++      #MESSAGE("#_outputDir_rel=3D${_outputDir_rel}")
> > ++
> > ++      IF("${_outputDir_rel}" STREQUAL ".")
> > ++          ADD_CUSTOM_TARGET_COMMAND(pack_src
> > ++              OUTPUT "${SOURCE_ARCHIVE_FILE}"
> > ++              COMMAND make package_source
> > ++              DEPENDS  ${SOURCE_ARCHIVE_CONTENTS}
> > ++              COMMENT "Packing the source as: ${SOURCE_ARCHIVE_FILE}"
> > ++              )
> > ++      ELSE("${_outputDir_rel}" STREQUAL ".")
> > ++          FILE(MAKE_DIRECTORY ${outputDir})
> > ++          ADD_CUSTOM_TARGET_COMMAND(pack_src
> > ++              OUTPUT "${SOURCE_ARCHIVE_FILE}"
> > ++              COMMAND make package_source
> > ++              COMMAND cmake -E copy "${SOURCE_ARCHIVE_NAME}" "${outpu=
tDir}"
> > ++              COMMAND cmake -E remove ${SOURCE_ARCHIVE_NAME}
> > ++              DEPENDS ${SOURCE_ARCHIVE_CONTENTS_ABSOLUTE}
> > ++              COMMENT "Packing the source as: ${SOURCE_ARCHIVE_FILE}"
> > ++              )
> > ++      ENDIF("${_outputDir_rel}" STREQUAL ".")
> > ++
> > ++      ADD_CUSTOM_TARGET(clean_old_pack_src
> > ++          COMMAND find .
> > ++          -name '${PROJECT_NAME}*.${SOURCE_ARCHIVE_FILE_EXTENSION}' !=
 -name '${PROJECT_NAME}-${PRJ_VER}-*.${SOURCE_ARCHIVE_FILE_EXTENSION}'
> > ++          -print -delete
> > ++          COMMENT "Cleaning old source archives"
> > ++          )
> > ++
> > ++      ADD_DEPENDENCIES(clean_old_pack_src changelog )
> > ++
> > ++      ADD_CUSTOM_TARGET(clean_pack_src
> > ++          COMMAND find .
> > ++          -name '${PROJECT_NAME}*.${SOURCE_ARCHIVE_FILE_EXTENSION}'
> > ++          -print -delete
> > ++          COMMENT "Cleaning all source archives"
> > ++          )
> > ++    ENDMACRO(PACK_SOURCE_ARCHIVE outputDir)
> > ++
> > ++ENDIF(NOT DEFINED _MANAGE_ARCHIVE_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageEnvironment.cmake
> > +@@ -0,0 +1,190 @@
> > ++# - Manage build environment such as environment variables and compil=
e flags.
> > ++# This module predefine various environment variables, cmake policies=
, and
> > ++# compile flags.
> > ++#
> > ++# The setting can be viewed and modified by ccmake.
> > ++#
> > ++# List of frequently used variable and compile flags:
> > ++#    + CMAKE_INSTALL_PREFIX: Compile flag whose value is ${CMAKE_INST=
ALL_PREFIX}.
> > ++#    + BIN_DIR: Directory for executable.
> > ++#      Default:  ${CMAKE_INSTALL_PREFIX}/bin
> > ++#    + DATA_DIR: Directory for architecture independent data files.
> > ++#      Default: ${CMAKE_INSTALL_PREFIX}/share
> > ++#    + DOC_DIR: Directory for documentation
> > ++#      Default: ${DATA_DIR}/doc
> > ++#    + SYSCONF_DIR: System wide configuration files.
> > ++#      Default: /etc
> > ++#    + LIB_DIR: System wide library path.
> > ++#      Default: ${CMAKE_INSTALL_PREFIX}/lib for 32 bit,
> > ++#               ${CMAKE_INSTALL_PREFIX}/lib64 for 64 bit.
> > ++#    + LIBEXEC_DIR: Executables that are not meant to be executed by =
user directly.
> > ++#      Default: ${CMAKE_INSTALL_PREFIX}/libexec
> > ++#    + PROJECT_NAME: Project name
> > ++#
> > ++# Defines following macros:
> > ++#   SET_COMPILE_ENV(var default_value [ENV_NAME env_name]
> > ++#     [CACHE type docstring [FORCE]])
> > ++#   - Ensure a variable is set to nonempty value, then add the variab=
le and value to
> > ++#     compiling definition.
> > ++#     The value is determined by following order:
> > ++#     1. Value of var if var is defined.
> > ++#     2. Environment variable with the same name (or specified via EN=
V_NAME)
> > ++#     3. Parameter default_value
> > ++#     Parameters:
> > ++#     + var: Variable to be set
> > ++#     + default_value: Default value of the var
> > ++#     + env_name: (Optional)The name of environment variable.
> > ++#       Only need if different from var.
> > ++#     + CACHE type docstring [FORCE]:
> > ++#       Same with "SET" command.
> > ++#
> > ++#  SET_USUAL_COMPILE_ENVS()
> > ++#  - Set the most often used variable and compile flags.
> > ++#    It defines compile flags according to the values of correspondin=
g variables,
> > ++#    usually under the same or similar name.
> > ++#    If a corresponding variable is not defined yet, then a default v=
alue is assigned
> > ++#    to that variable, then define the flag.
> > ++#
> > ++#    Defines following flags according to the variable with same name=
.
> > ++#    + CMAKE_INSTALL_PREFIX: Compile flag whose value is ${CMAKE_INST=
ALL_PREFIX}.
> > ++#    + BIN_DIR: Directory for executable.
> > ++#      Default:  ${CMAKE_INSTALL_PREFIX}/bin
> > ++#    + DATA_DIR: Directory for architecture independent data files.
> > ++#      Default: ${CMAKE_INSTALL_PREFIX}/share
> > ++#    + DOC_DIR: Directory for documentation
> > ++#      Default: ${DATA_DIR}/doc
> > ++#    + SYSCONF_DIR: System wide configuration files.
> > ++#      Default: /etc
> > ++#    + LIB_DIR: System wide library path.
> > ++#      Default: ${CMAKE_INSTALL_PREFIX}/lib for 32 bit,
> > ++#               ${CMAKE_INSTALL_PREFIX}/lib64 for 64 bit.
> > ++#    + LIBEXEC_DIR: Executables that are not meant to be executed by =
user directly.
> > ++#      Default: ${CMAKE_INSTALL_PREFIX}/libexec
> > ++#    + PROJECT_NAME: Project name
> > ++#    + PRJ_VER: Project version
> > ++#    + PRJ_DATA_DIR: Data directory for the project.
> > ++#      Default: ${DATA_DIR}/${PROJECT_NAME}
> > ++#    + PRJ_DOC_DIR: DocuFILEPATH =3D File chooser dialog.
> > ++#      Default: ${DOC_DIR}/${PROJECT_NAME}-${PRJ_VER}
> > ++
> > ++IF(NOT DEFINED _MANAGE_ENVIRONMENT_CMAKE_)
> > ++    SET(_MANAGE_ENVIRONMENT_CMAKE_ "DEFINED")
> > ++    SET(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS ON)
> > ++    CMAKE_POLICY(VERSION 2.6.2)
> > ++
> > ++    MACRO(SET_COMPILE_ENV var default_value)
> > ++      SET(_stage "")
> > ++      SET(_env "${var}")
> > ++      SET(_setOpts "")
> > ++      SET(_force 0)
> > ++      FOREACH(_arg ${ARGN})
> > ++          IF(_arg STREQUAL "ENV_NAME")
> > ++              SET(_stage "ENV_NAME")
> > ++          ELSEIF(_arg STREQUAL "CACHE")
> > ++              SET(_stage "_CACHE")
> > ++          ELSE(_arg STREQUAL "ENV_NAME")
> > ++              IF(_stage STREQUAL "ENV_NAME")
> > ++                  SET(_env "${_arg}")
> > ++              ELSEIF(_stage STREQUAL "_CACHE")
> > ++                  LIST(APPEND _setOpts "${_arg}")
> > ++                  IF(_arg STREQUAL "FORCE")
> > ++                      SET(_force 1)
> > ++                  ENDIF(_arg STREQUAL "FORCE")
> > ++              ENDIF(_stage STREQUAL "ENV_NAME")
> > ++          ENDIF(_arg STREQUAL "ENV_NAME")
> > ++      ENDFOREACH(_arg ${ARGN})
> > ++
> > ++      IF(NOT "${_setOpts}" STREQUAL "")
> > ++          LIST(INSERT _setOpts 0 "CACHE")
> > ++      ENDIF(NOT "${_setOpts}" STREQUAL "")
> > ++
> > ++      # Set the variable
> > ++      IF(_force)
> > ++          IF(NOT "$ENV{${_env}}" STREQUAL "")
> > ++              SET(${var} "$ENV{${_env}}" ${_setOpts})
> > ++          ELSE(NOT "$ENV{${_env}}" STREQUAL "")
> > ++              SET(${var} "${default_value}" ${_setOpts})
> > ++          ENDIF(NOT "$ENV{${_env}}" STREQUAL "")
> > ++      ELSE(_force)
> > ++          IF(NOT "${${var}}" STREQUAL "")
> > ++              SET(${var} "${${var}}" ${_setOpts})
> > ++          ELSEIF(NOT "$ENV{${_env}}" STREQUAL "")
> > ++              SET(${var} "$ENV{${_env}}" ${_setOpts})
> > ++          ELSE(NOT "${${var}}" STREQUAL "")
> > ++              # Default value
> > ++              SET(${var} "${default_value}" ${_setOpts})
> > ++          ENDIF(NOT "${${var}}" STREQUAL "")
> > ++      ENDIF(_force)
> > ++
> > ++      # Enforce CMP0005 to new, yet pop after ADD_DEFINITION
> > ++      CMAKE_POLICY(PUSH)
> > ++      CMAKE_POLICY(SET CMP0005 NEW)
> > ++      ADD_DEFINITIONS(-D${_env}=3D${${var}})
> > ++      CMAKE_POLICY(POP)
> > ++      M_MSG(${M_INFO2} "SET(${var} ${${var}})")
> > ++    ENDMACRO(SET_COMPILE_ENV var default_value)
> > ++
> > ++    MACRO(MANAGE_CMAKE_POLICY policyName defaultValue)
> > ++      IF(POLICY ${policyName})
> > ++          CMAKE_POLICY(GET "${policyName}" _cmake_policy_value)
> > ++          IF(_cmake_policy_value STREQUAL "")
> > ++              # Policy not defined yet
> > ++              CMAKE_POLICY(SET "${policyName}" "${defaultValue}")
> > ++          ENDIF(_cmake_policy_value STREQUAL "")
> > ++      ENDIF(POLICY ${policyName})
> > ++    ENDMACRO(MANAGE_CMAKE_POLICY policyName defaultValue)
> > ++
> > ++    #################################################################=
###
> > ++    # Recommended policy setting
> > ++    #
> > ++    # CMP0005: Preprocessor definition values are now escaped automat=
ically.
> > ++    # OLD:Preprocessor definition values are not escaped.
> > ++    MANAGE_CMAKE_POLICY(CMP0005 NEW)
> > ++
> > ++    # CMP0009: FILE GLOB_RECURSE calls should not follow symlinks by =
default.
> > ++    # OLD: FILE GLOB_RECURSE calls follow symlinks
> > ++    MANAGE_CMAKE_POLICY(CMP0009 NEW)
> > ++
> > ++    # CMP0017: Prefer files from the CMake module directory when incl=
uding from there.
> > ++    # OLD: Prefer files from CMAKE_MODULE_PATH regardless
> > ++    MANAGE_CMAKE_POLICY(CMP0017 NEW)
> > ++
> > ++    # Include should be put after the cmake policy
> > ++    INCLUDE(ManageMessage)
> > ++    M_MSG(${M_INFO1} "CMAKE_HOST_SYSTEM=3D${CMAKE_HOST_SYSTEM}")
> > ++    M_MSG(${M_INFO1} "CMAKE_SYSTEM=3D${CMAKE_SYSTEM}")
> > ++
> > ++    #################################################################=
###
> > ++    # CMake Variables
> > ++    #
> > ++    SET_COMPILE_ENV(BIN_DIR  "${CMAKE_INSTALL_PREFIX}/bin"
> > ++      CACHE PATH "Binary dir")
> > ++    SET_COMPILE_ENV(DATA_DIR "${CMAKE_INSTALL_PREFIX}/share"
> > ++      CACHE PATH "Data dir")
> > ++    SET_COMPILE_ENV(DOC_DIR  "${DATA_DIR}/doc"
> > ++      CACHE PATH "Documentation dir")
> > ++    SET_COMPILE_ENV(SYSCONF_DIR "/etc"
> > ++      CACHE PATH "System configuration dir")
> > ++    SET_COMPILE_ENV(LIBEXEC_DIR "${CMAKE_INSTALL_PREFIX}/libexec"
> > ++      CACHE PATH "LIBEXEC dir")
> > ++
> > ++    IF(CMAKE_SYSTEM_PROCESSOR MATCHES "64")
> > ++      SET_COMPILE_ENV(IS_64 "64" CACHE STRING "IS_64")
> > ++    ENDIF(CMAKE_SYSTEM_PROCESSOR MATCHES "64")
> > ++
> > ++    SET_COMPILE_ENV(LIB_DIR "${CMAKE_INSTALL_PREFIX}/lib${IS_64}"
> > ++      CACHE PATH "Library dir")
> > ++
> > ++    SET_COMPILE_ENV(PROJECT_NAME "${PROJECT_NAME}")
> > ++    SET_COMPILE_ENV(PRJ_DATA_DIR "${DATA_DIR}/${PROJECT_NAME}")
> > ++
> > ++    # Directory to store cmake-fedora specific temporary files.
> > ++    IF(NOT CMAKE_FEDORA_TMP_DIR)
> > ++      SET(CMAKE_FEDORA_TMP_DIR "${CMAKE_BINARY_DIR}/NO_PACK")
> > ++    ENDIF(NOT CMAKE_FEDORA_TMP_DIR)
> > ++
> > ++    ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_FEDORA_TMP_DIR}
> > ++      COMMAND cmake -E make_directory ${CMAKE_FEDORA_TMP_DIR}
> > ++      COMMENT "Create CMAKE_FEDORA_TMP_DIR"
> > ++      )
> > ++ENDIF(NOT DEFINED _MANAGE_ENVIRONMENT_CMAKE_)
> > +--- /dev/null
> > ++++ b/Modules/ManageGConf.cmake
> > +@@ -0,0 +1,67 @@
> > ++# - GConf relative targets such as install/unstall schemas.
> > ++# This module finds gconftool-2 or gconftool for GConf manipulation.
> > ++#
> > ++# Reads following variables:
> > ++# GCONF_SCHEMAS_FILE: Schema file.
> > ++#         Default: "${PROJECT_NAME}.schemas"
> > ++#
> > ++# GCONF_SCHEMAS_INSTALLED_DIR: Direct of installed schemas files.
> > ++#         Default: "${SYSCONF_INSTALL_DIR}/gconf/schemas"
> > ++#
> > ++# GCONF_CONFIG_SOURCE: configuration source.
> > ++#         Default: "" (Use the system default)
> > ++#
> > ++# Defines following targets:
> > ++#   install_schemas: install schemas
> > ++#
> > ++#   uninstall_schemas: uninstall schemas
> > ++#
> > ++
> > ++IF(NOT DEFINED _MANAGE_GCONF_CMAKE_)
> > ++    FIND_PROGRAM(GCONFTOOL_CMD NAMES gconftool-2 gconftool)
> > ++
> > ++    IF(${GCONFTOOL_CMD} STREQUAL "GCONFTOOL_CMD-NOTFOUND")
> > ++      MESSAGE(FATAL_ERROR "gconftool and gconftool-2 are not found, p=
lease install GConf or GConf2.")
> > ++    ENDIF()
> > ++
> > ++    IF (NOT DEFINED GCONF_SCHEMAS_FILE)
> > ++      SET(GCONF_SCHEMAS_FILE  "${PROJECT_NAME}.schemas")
> > ++    ENDIF(NOT DEFINED GCONF_SCHEMAS_FILE)
> > ++
> > ++    GET_FILENAME_COMPONENT(_gconf_schemas_basename ${GCONF_SCHEMAS_FI=
LE} NAME)
> > ++
> > ++    IF (NOT DEFINED GCONF_SCHEMAS_INSTALLED_DIR)
> > ++      IF(SYSCONF_INSTALL_DIR)
> > ++          SET(GCONF_SCHEMAS_INSTALLED_DIR  "${SYSCONF_INSTALL_DIR}/gc=
onf/schemas")
> > ++      ELSE(SYSCONF_INSTALL_DIR)
> > ++          SET(GCONF_SCHEMAS_INSTALLED_DIR  "${SYSCONF_DIR}/gconf/sche=
mas")
> > ++      ENDIF(SYSCONF_INSTALL_DIR)
> > ++    ENDIF(NOT DEFINED GCONF_SCHEMAS_INSTALLED_DIR)
> > ++
> > ++    IF (NOT DEFINED GCONF_CONFIG_SOURCE)
> > ++      SET(GCONF_CONFIG_SOURCE "")
> > ++    ENDIF(NOT DEFINED GCONF_CONFIG_SOURCE)
> > ++    SET(ENV{GCONF_CONFIG_SOURCE} ${GCONF_CONFIG_SOURCE})
> > ++
> > ++
> > ++    ADD_CUSTOM_TARGET(uninstall_schemas
> > ++      COMMAND GCONF_CONFIG_SOURCE=3D${GCONF_CONFIG_SOURCE}
> > ++      ${GCONFTOOL_CMD} --makefile-uninstall-rule
> > ++      ${GCONF_SCHEMAS_INSTALLED_DIR}/${_gconf_schemas_basename}
> > ++      COMMENT "Uninstalling schemas"
> > ++      )
> > ++
> > ++    ADD_CUSTOM_TARGET(install_schemas
> > ++      COMMAND cmake -E copy ${GCONF_SCHEMAS_FILE} ${GCONF_SCHEMAS_INS=
TALLED_DIR}/${_gconf_schemas_basename}
> > ++      COMMAND GCONF_CONFIG_SOURCE=3D${GCONF_CONFIG_SOURCE}
> > ++      ${GCONFTOOL_CMD} --makefile-install-rule
> > ++      ${GCONF_SCHEMAS_INSTALLED_DIR}/${_gconf_schemas_basename}
> > ++      DEPENDS ${GCONF_SCHEMAS_FILE}
> > ++      COMMENT "Installing schemas"
> > ++      )
> > ++
> > ++    INSTALL(FILES ${GCONF_SCHEMAS_FILE}
> > ++      DESTINATION "${GCONF_SCHEMAS_INSTALLED_DIR}")
> > ++ENDIF(NOT DEFINED _MANAGE_GCONF_CMAKE_)
> > ++
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageInstall.cmake
> > +@@ -0,0 +1,25 @@
> > ++# - Manage installation
> > ++# Convenient collection of macros and functions to manage installatio=
n.
> > ++#
> > ++# Defines following macros:
> > ++#   MANAGE_INSTALL(var file1 [file2 ....])
> > ++#   - Managed install. Files are installed to the path specified by v=
ar.
> > ++#     This macro also sets 'MANAGE_INSTALL_$var' as files that associ=
ate to this var
> > ++#     The files that are associated to this var is
> > ++#     Read and define:
> > ++#     + MANAGE_INSTALL_$var : Files to be installed under var.
> > ++#     Arguments:
> > ++#     + var: A variable that contains install destination path
> > ++#     + file1 ... : File to be installed to $var
> > ++#
> > ++
> > ++IF(NOT DEFINED _MANAGE_INSTALL_CMAKE_)
> > ++    SET (_MANAGE_INSTALL_CMAKE_ "DEFINED")
> > ++    SET(MANAGE_INSTALL_FILES "")
> > ++
> > ++    MACRO(MANAGE_INSTALL var file1)
> > ++      LIST(APPEND MANAGE_INSTALL_${var} ${file1} ${ARGN})
> > ++      INSTALL(FILES $file1 ${ARGN}
> > ++          DESTINATION "${var}")
> > ++    ENDMACRO(MANAGE_INSTALL var file1)
> > ++ENDIF(NOT DEFINED _MANAGE_INSTALL_CMAKE_)
> > +--- /dev/null
> > ++++ b/Modules/ManageMessage.cmake
> > +@@ -0,0 +1,60 @@
> > ++# - Manage the output and debug messages.
> > ++# This module has macros that control how many messages to be shown
> > ++# by defining the desire message level.
> > ++#
> > ++# Defined variables that represent verbose levels:
> > ++#   1: M_FATAL - Critical error,Should stop immediately
> > ++#   2: M_ERROR - Error that will Eventually fail
> > ++#   3: M_WARN  - General Warning.
> > ++#   4: M_OFF   - Optional functionalities are turned-off because requ=
irement is not met.
> > ++#   5: M_INFO1 - Info/debug message
> > ++#   6: M_INFO2 - Info/debug message
> > ++#   7: M_INFO3 - Info/debug message
> > ++#
> > ++# Read following variable:
> > ++#   + MANAGE_MESSAGE_LEVEL: Message level in integer.
> > ++#     Messages with greater level will be suppressed.
> > ++#     Default is ${M_OFF}
> > ++#   + MANAGE_MESSAGE_LABELS: Labels that printed in front of the mess=
age for
> > ++#     corresponding message level.
> > ++#     Default is "[Fatal] ;[Error] ;[Warn] ;[Off] ;[Info1] ;[Info2] ;=
[Info3] ")
> > ++#
> > ++# Define following macros:
> > ++#   M_MSG(level msg)
> > ++#   - Surpress the message if level is higher than MANAGE_MESSAGE_LEV=
EL
> > ++#     Otherwise show the message.
> > ++#     Arguments:
> > ++#     + level: level of the message.
> > ++#     + msg: Message to show.
> > ++#
> > ++
> > ++
> > ++IF(NOT DEFINED _MANAGE_MESSAGE_CMAKE_)
> > ++    SET(_MANAGE_MESSAGE_CMAKE_ "DEFINED")
> > ++    SET(M_FATAL 1)
> > ++    SET(M_ERROR 2)
> > ++    SET(M_WARN 3)
> > ++    SET(M_OFF  4)
> > ++    SET(M_INFO1 5)
> > ++    SET(M_INFO2 6)
> > ++    SET(M_INFO3 7)
> > ++    IF(NOT DEFINED MANAGE_MESSAGE_LABELS)
> > ++      SET(MANAGE_MESSAGE_LABELS
> > ++          "[Fatal] ;[Error] ;[Warn] ;[Off] ;[Info1] ;[Info2] ;[Info3]=
 ")
> > ++    ENDIF(NOT DEFINED MANAGE_MESSAGE_LABELS)
> > ++
> > ++    SET(MANAGE_MESSAGE_LEVEL ${M_OFF} CACHE STRING "Message (Verbose)=
 Level")
> > ++
> > ++    MACRO(M_MSG level msg)
> > ++      IF(NOT ${level} GREATER ${MANAGE_MESSAGE_LEVEL})
> > ++          MATH(EXPR _lvl ${level}-1)
> > ++          LIST(GET MANAGE_MESSAGE_LABELS ${_lvl} _label)
> > ++          IF(${level} EQUAL 1)
> > ++              MESSAGE(FATAL_ERROR "${_label}${msg}")
> > ++          ELSE(${level} EQUAL 1)
> > ++              MESSAGE("${_label}${msg}")
> > ++          ENDIF(${level} EQUAL 1)
> > ++      ENDIF(NOT ${level} GREATER ${MANAGE_MESSAGE_LEVEL})
> > ++    ENDMACRO(M_MSG level msg)
> > ++ENDIF(NOT DEFINED _MANAGE_MESSAGE_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageRPM.cmake
> > +@@ -0,0 +1,327 @@
> > ++# - RPM generation, maintaining (remove old rpm) and verification (rp=
mlint).
> > ++# This module provides macros that provides various rpm building and
> > ++# verification targets.
> > ++#
> > ++# This module needs variable from ManageArchive, so INCLUDE(ManageArc=
hive)
> > ++# before this module.
> > ++#
> > ++# Includes:
> > ++#   ManageMessage
> > ++#   ManageTarget
> > ++#
> > ++# Reads and defines following variables if dependencies are satisfied=
:
> > ++#   PRJ_RPM_SPEC_IN_FILE: spec.in that generate spec
> > ++#   PRJ_RPM_SPEC_FILE: spec file for rpmbuild.
> > ++#   RPM_DIST_TAG: (optional) Current distribution tag such as el5, fc=
10.
> > ++#     Default: Distribution tag from rpm --showrc
> > ++#
> > ++#   RPM_BUILD_TOPDIR: (optional) Directory of  the rpm topdir.
> > ++#     Default: ${CMAKE_BINARY_DIR}
> > ++#
> > ++#   RPM_BUILD_SPECS: (optional) Directory of generated spec files
> > ++#     and RPM-ChangeLog.
> > ++#     Note this variable is not for locating
> > ++#     SPEC template (project.spec.in), RPM-ChangeLog source files.
> > ++#     These are located through the path of spec_in.
> > ++#     Default: ${RPM_BUILD_TOPDIR}/SPECS
> > ++#
> > ++#   RPM_BUILD_SOURCES: (optional) Directory of source (tar.gz or zip)=
 files.
> > ++#     Default: ${RPM_BUILD_TOPDIR}/SOURCES
> > ++#
> > ++#   RPM_BUILD_SRPMS: (optional) Directory of source rpm files.
> > ++#     Default: ${RPM_BUILD_TOPDIR}/SRPMS
> > ++#
> > ++#   RPM_BUILD_RPMS: (optional) Directory of generated rpm files.
> > ++#     Default: ${RPM_BUILD_TOPDIR}/RPMS
> > ++#
> > ++#   RPM_BUILD_BUILD: (optional) Directory for RPM build.
> > ++#     Default: ${RPM_BUILD_TOPDIR}/BUILD
> > ++#
> > ++#   RPM_BUILD_BUILDROOT: (optional) Directory for RPM build.
> > ++#     Default: ${RPM_BUILD_TOPDIR}/BUILDROOT
> > ++#
> > ++# Defines following variables:
> > ++#   RPM_IGNORE_FILES: A list of exclude file patterns for PackSource.
> > ++#     This value is appended to SOURCE_ARCHIVE_IGNORE_FILES after inc=
luding
> > ++#     this module.
> > ++#
> > ++# Defines following Macros:
> > ++#   PACK_RPM()
> > ++#   - Generate spec and pack rpm  according to the spec file.
> > ++#     Arguments:
> > ++#     Targets:
> > ++#     + srpm: Build srpm (rpmbuild -bs).
> > ++#     + rpm: Build rpm and srpm (rpmbuild -bb)
> > ++#     + rpmlint: Run rpmlint to generated rpms.
> > ++#     + clean_rpm": Clean all rpm and build files.
> > ++#     + clean_pkg": Clean all source packages, rpm and build files.
> > ++#     + clean_old_rpm: Remove old rpm and build files.
> > ++#     + clean_old_pkg: Remove old source packages and rpms.
> > ++#     This macro defines following variables:
> > ++#     + PRJ_RELEASE: Project release with distribution tags. (e.g. 1.=
fc13)
> > ++#     + PRJ_RELEASE_NO: Project release number, without distribution =
tags. (e.g. 1)
> > ++#     + PRJ_SRPM_FILE: Path to generated SRPM file, including relativ=
e path.
> > ++#     + PRJ_RPM_BUILD_ARCH: Architecture to be build.
> > ++#     + PRJ_RPM_FILES: Binary RPM files to be build.
> > ++#
> > ++#   RPM_MOCK_BUILD()
> > ++#   - Add mock related targets.
> > ++#     Targets:
> > ++#     + rpm_mock_i386: Make i386 rpm
> > ++#     + rpm_mock_x86_64: Make x86_64 rpm
> > ++#     This macor reads following variables?:
> > ++#     + MOCK_RPM_DIST_TAG: Prefix of mock configure file, such as "fe=
dora-11", "fedora-rawhide", "epel-5".
> > ++#         Default: Convert from RPM_DIST_TAG
> > ++#
> > ++
> > ++IF(NOT DEFINED _MANAGE_RPM_CMAKE_)
> > ++    SET (_MANAGE_RPM_CMAKE_ "DEFINED")
> > ++
> > ++    INCLUDE(ManageMessage)
> > ++    INCLUDE(ManageTarget)
> > ++    SET(_manage_rpm_dependency_missing 0)
> > ++
> > ++    FIND_PROGRAM(RPMBUILD_CMD NAMES "rpmbuild-md5")
> > ++    IF("${RPMBUILD_CMD}" STREQUAL "RPMBUILD_CMD-NOTFOUND")
> > ++      M_MSG(${M_OFF} "rpmbuild is not found in PATH, rpm build suppor=
t is disabled.")
> > ++      SET(_manage_rpm_dependency_missing 1)
> > ++    ENDIF("${RPMBUILD_CMD}" STREQUAL "RPMBUILD_CMD-NOTFOUND")
> > ++
> > ++    SET(_PRJ_RPM_SPEC_IN_FILE_SEARCH_NAMES  "${PROJECT_NAME}.spec.in"=
 "project.spec.in")
> > ++    SET(_PRJ_RPM_SPEC_IN_FILE_SEARCH_PATH "${CMAKE_SOURCE_DIR}/SPECS"=
 "SPECS" "." "${RPM_BUILD_TOPDIR}/SPECS")
> > ++    FIND_FILE(PRJ_RPM_SPEC_IN_FILE NAMES ${_PRJ_RPM_SPEC_IN_FILE_SEAR=
CH_NAMES} PATHS ${_PRJ_RPM_SPEC_IN_FILE_SEARCH_PATH})
> > ++    IF(PRJ_RPM_SPEC_IN_FILE STREQUAL "PRJ_RPM_SPEC_IN_FILE-NOTFOUND")
> > ++      M_MSG(${M_OFF} "Cannot find ${PROJECT}.spec.in or project .in"
> > ++          "${_PRJ_RPM_SPEC_IN_FILE_SEARCH_PATH}")
> > ++      M_MSG(${M_OFF} "rpm build support is disabled.")
> > ++      SET(_manage_rpm_dependency_missing 1)
> > ++    ENDIF(PRJ_RPM_SPEC_IN_FILE STREQUAL "PRJ_RPM_SPEC_IN_FILE-NOTFOUN=
D")
> > ++
> > ++    IF(NOT _manage_rpm_dependency_missing)
> > ++      INCLUDE(ManageVariable)
> > ++      SET (SPEC_FILE_WARNING "This file is generated, please modified=
 the .spec.in file instead!")
> > ++
> > ++      EXECUTE_PROCESS(COMMAND rpm --showrc
> > ++          COMMAND grep -E "dist[[:space:]]*\\."
> > ++          COMMAND sed -e "s/^.*dist\\s*\\.//"
> > ++          COMMAND tr \\n \\t
> > ++          COMMAND sed  -e s/\\t//
> > ++          OUTPUT_VARIABLE _RPM_DIST_TAG)
> > ++
> > ++      SET(RPM_DIST_TAG "${_RPM_DIST_TAG}" CACHE STRING "RPM Dist Tag"=
)
> > ++      SET(RPM_BUILD_TOPDIR "${CMAKE_BINARY_DIR}" CACHE PATH "RPM topd=
ir")
> > ++      SET(RPM_BUILD_SPECS "${RPM_BUILD_TOPDIR}/SPECS" CACHE PATH "RPM=
 SPECS dir")
> > ++      SET(RPM_BUILD_SOURCES "${RPM_BUILD_TOPDIR}/SOURCES" CACHE PATH =
"RPM SOURCES dir")
> > ++      SET(RPM_BUILD_SRPMS "${RPM_BUILD_TOPDIR}/SRPMS" CACHE PATH "RPM=
 SRPMS dir")
> > ++      SET(RPM_BUILD_RPMS "${RPM_BUILD_TOPDIR}/RPMS" CACHE PATH "RPM R=
PMS dir")
> > ++      SET(RPM_BUILD_BUILD "${RPM_BUILD_TOPDIR}/BUILD" CACHE PATH "RPM=
 BUILD dir")
> > ++      SET(RPM_BUILD_BUILDROOT "${RPM_BUILD_TOPDIR}/BUILDROOT" CACHE P=
ATH "RPM BUILDROOT dir")
> > ++
> > ++      ## RPM spec.in and RPM-ChangeLog.prev
> > ++      SET(PRJ_RPM_SPEC_FILE "${RPM_BUILD_SPECS}/${PROJECT_NAME}.spec"=
 CACHE FILEPATH "spec")
> > ++      SET(PRJ_RPM_SPEC_IN_FILE "${_PRJ_RPM_SPEC_IN_FILE}" CACHE FILEP=
ATH "spec.in")
> > ++      GET_FILENAME_COMPONENT(_PRJ_RPM_SPEC_IN_DIR "${PRJ_RPM_SPEC_IN_=
FILE}" PATH)
> > ++      SET(PRJ_RPM_SPEC_IN_DIR "${_PRJ_RPM_SPEC_IN_DIR}" CACHE INTERNA=
L "Dir contains spec.in")
> > ++      SET(RPM_CHANGELOG_PREV_FILE "${PRJ_RPM_SPEC_IN_DIR}/RPM-ChangeL=
og.prev" CACHE FILEPATH "ChangeLog.prev for RPM")
> > ++      SET(RPM_CHANGELOG_FILE "${RPM_BUILD_SPECS}/RPM-ChangeLog" CACHE=
 FILEPATH "ChangeLog for RPM")
> > ++
> > ++      # Add RPM build directories in ignore file list.
> > ++      GET_FILENAME_COMPONENT(_rpm_build_sources_basename ${RPM_BUILD_=
SOURCES} NAME)
> > ++      GET_FILENAME_COMPONENT(_rpm_build_srpms_basename ${RPM_BUILD_SR=
PMS} NAME)
> > ++      GET_FILENAME_COMPONENT(_rpm_build_rpms_basename ${RPM_BUILD_RPM=
S} NAME)
> > ++      GET_FILENAME_COMPONENT(_rpm_build_build_basename ${RPM_BUILD_BU=
ILD} NAME)
> > ++      GET_FILENAME_COMPONENT(_rpm_build_buildroot_basename ${RPM_BUIL=
D_BUILDROOT} NAME)
> > ++      SET(RPM_IGNORE_FILES
> > ++          "/${_rpm_build_sources_basename}/" "/${_rpm_build_srpms_bas=
ename}/" "/${_rpm_build_rpms_basename}/"
> > ++          "/${_rpm_build_build_basename}/" "/${_rpm_build_buildroot_b=
asename}/" "debug.*s.list")
> > ++      LIST(APPEND SOURCE_ARCHIVE_IGNORE_FILES ${RPM_IGNORE_FILES})
> > ++
> > ++    ENDIF(NOT _manage_rpm_dependency_missing)
> > ++
> > ++    FUNCTION(PRJ_RPM_SPEC_IN_READ_FILE)
> > ++      SETTING_FILE_GET_VARIABLE(_releaseStr Release "${PRJ_RPM_SPEC_I=
N_FILE}" ":")
> > ++      STRING(REPLACE "%{?dist}" ".${RPM_DIST_TAG}" _PRJ_RELEASE ${_re=
leaseStr})
> > ++      STRING(REPLACE "%{?dist}" "" _PRJ_RELEASE_NO ${_releaseStr})
> > ++      #MESSAGE("_releaseTag=3D${_releaseTag} _releaseStr=3D${_release=
Str}")
> > ++
> > ++      SET(PRJ_RELEASE ${_PRJ_RELEASE} CACHE STRING "Release with dist=
" FORCE)
> > ++      SET(PRJ_RELEASE_NO ${_PRJ_RELEASE_NO} CACHE STRING "Release w/o=
 dist" FORCE)
> > ++      SET(PRJ_SRPM "${PROJECT_NAME}-${PRJ_VER}-${PRJ_RELEASE}.src.rpm=
" CACHE STRING "PRJ SRPM" FORCE)
> > ++      SET(PRJ_SRPM_FILE "${RPM_BUILD_SRPMS}/${PRJ_SRPM}" CACHE FILEPA=
TH "PRJ SRPM File" FORCE)
> > ++
> > ++      ## GET BuildArch
> > ++      SETTING_FILE_GET_VARIABLE(_archStr BuildArch "${PRJ_RPM_SPEC_IN=
_FILE}" ":")
> > ++      IF(NOT _archStr STREQUAL "noarch")
> > ++          SET(_archStr ${CMAKE_HOST_SYSTEM_PROCESSOR})
> > ++      ENDIF(NOT _archStr STREQUAL "noarch")
> > ++      SET(PRJ_RPM_BUILD_ARCH "${_archStr}" CACHE STRING "BuildArch")
> > ++
> > ++      ## Main rpm
> > ++      SET(PRJ_RPM_FILES "${RPM_BUILD_RPMS}/${PRJ_RPM_BUILD_ARCH}/${PR=
OJECT_NAME}-${PRJ_VER}-${PRJ_RELEASE}.${PRJ_RPM_BUILD_ARCH}.rpm"
> > ++          CACHE STRING "RPM files" FORCE)
> > ++
> > ++      ## Obtains sub packages
> > ++      ## [TODO]
> > ++    ENDFUNCTION(PRJ_RPM_SPEC_IN_READ_FILE)
> > ++
> > ++    MACRO(RPM_CHANGELOG_WRITE_FILE)
> > ++      INCLUDE(DateTimeFormat)
> > ++
> > ++      FILE(WRITE ${RPM_CHANGELOG_FILE} "* ${TODAY_CHANGELOG} ${MAINTA=
INER} - ${PRJ_VER}-${PRJ_RELEASE_NO}\n")
> > ++      FILE(READ "${CMAKE_FEDORA_TMP_DIR}/ChangeLog.this" CHANGELOG_IT=
EMS)
> > ++
> > ++      FILE(APPEND ${RPM_CHANGELOG_FILE} "${CHANGELOG_ITEMS}\n\n")
> > ++
> > ++      # Update RPM_ChangeLog
> > ++      # Use this instead of FILE(READ is to avoid error when reading =
'\'
> > ++      # character.
> > ++      EXECUTE_PROCESS(COMMAND cat "${RPM_CHANGELOG_PREV_FILE}"
> > ++          OUTPUT_VARIABLE RPM_CHANGELOG_PREV
> > ++          OUTPUT_STRIP_TRAILING_WHITESPACE)
> > ++
> > ++      FILE(APPEND ${RPM_CHANGELOG_FILE} "${RPM_CHANGELOG_PREV}")
> > ++
> > ++      ADD_CUSTOM_COMMAND(OUTPUT ${RPM_CHANGELOG_FILE}
> > ++          COMMAND ${CMAKE_COMMAND} ${CMAKE_SOURCE_DIR}
> > ++          DEPENDS ${CHANGELOG_FILE} ${RPM_CHANGELOG_PREV_FILE}
> > ++          COMMENT "Write ${RPM_CHANGELOG_FILE}"
> > ++          VERBATIM
> > ++          )
> > ++
> > ++      ADD_CUSTOM_TARGET(rpm_changelog_prev_update
> > ++          COMMAND ${CMAKE_COMMAND} -E copy ${RPM_CHANGELOG_FILE} ${RP=
M_CHANGELOG_PREV_FILE}
> > ++          DEPENDS ${RPM_CHANGELOG_FILE}
> > ++          COMMENT "${RPM_CHANGELOG_FILE} are saving as ${RPM_CHANGELO=
G_PREV_FILE}"
> > ++          )
> > ++
> > ++      IF(TARGET after_release_commit_pre)
> > ++          ADD_DEPENDENCIES(after_release_commit_pre rpm_changelog_pre=
v_update)
> > ++      ENDIF(TARGET after_release_commit_pre)
> > ++    ENDMACRO(RPM_CHANGELOG_WRITE_FILE)
> > ++
> > ++    MACRO(PACK_RPM)
> > ++      IF(NOT _manage_rpm_dependency_missing )
> > ++          PRJ_RPM_SPEC_IN_READ_FILE()
> > ++          RPM_CHANGELOG_WRITE_FILE()
> > ++
> > ++          # Generate spec
> > ++          CONFIGURE_FILE(${PRJ_RPM_SPEC_IN_FILE} ${PRJ_RPM_SPEC_FILE}=
)
> > ++
> > ++          #----------------------------------------------------------=
---------
> > ++          # RPM build commands and targets
> > ++
> > ++          FILE(MAKE_DIRECTORY  ${RPM_BUILD_BUILD})
> > ++
> > ++          # Don't worry about SRPMS, RPMS and BUILDROOT, it will be c=
reated by rpmbuild
> > ++
> > ++          ADD_CUSTOM_TARGET_COMMAND(srpm
> > ++              OUTPUT ${PRJ_SRPM_FILE}
> > ++              COMMAND ${RPMBUILD_CMD} -bs ${PRJ_RPM_SPEC_FILE}
> > ++              --define '_sourcedir ${RPM_BUILD_SOURCES}'
> > ++              --define '_builddir ${RPM_BUILD_BUILD}'
> > ++              --define '_srcrpmdir ${RPM_BUILD_SRPMS}'
> > ++              --define '_rpmdir ${RPM_BUILD_RPMS}'
> > ++              --define '_specdir ${RPM_BUILD_SPECS}'
> > ++              DEPENDS ${PRJ_RPM_SPEC_FILE} ${SOURCE_ARCHIVE_FILE}
> > ++              COMMENT "Building srpm"
> > ++              )
> > ++
> > ++          # RPMs (except SRPM)
> > ++
> > ++          ADD_CUSTOM_TARGET_COMMAND(rpm
> > ++              OUTPUT ${PRJ_RPM_FILES}
> > ++              COMMAND ${RPMBUILD_CMD} -ba  ${PRJ_RPM_SPEC_FILE}
> > ++              --define '_sourcedir ${RPM_BUILD_SOURCES}'
> > ++              --define '_builddir ${RPM_BUILD_BUILD}'
> > ++              --define '_buildrootdir ${RPM_BUILD_BUILDROOT}'
> > ++              --define '_srcrpmdir ${RPM_BUILD_SRPMS}'
> > ++              --define '_rpmdir ${RPM_BUILD_RPMS}'
> > ++              --define '_specdir ${RPM_BUILD_SPECS}'
> > ++              DEPENDS ${PRJ_RPM_SPEC_FILE} ${PRJ_SRPM_FILE}
> > ++              COMMENT "Building rpm"
> > ++              )
> > ++
> > ++
> > ++          ADD_CUSTOM_TARGET(install_rpms
> > ++              COMMAND find ${RPM_BUILD_RPMS}/${PRJ_RPM_BUILD_ARCH}
> > ++              -name '${PROJECT_NAME}*-${PRJ_VER}-${PRJ_RELEASE_NO}.*.=
${PRJ_RPM_BUILD_ARCH}.rpm' !
> > ++              -name '${PROJECT_NAME}-debuginfo-${PRJ_RELEASE_NO}.*.${=
PRJ_RPM_BUILD_ARCH}.rpm'
> > ++              -print -exec sudo rpm --upgrade --hash --verbose '{}' '=
\\;'
> > ++              DEPENDS ${PRJ_RPM_FILES}
> > ++              COMMENT "Install all rpms except debuginfo"
> > ++              )
> > ++
> > ++          ADD_CUSTOM_TARGET(rpmlint
> > ++              COMMAND find .
> > ++              -name '${PROJECT_NAME}*-${PRJ_VER}-${PRJ_RELEASE_NO}.*.=
rpm'
> > ++              -print -exec rpmlint '{}' '\\;'
> > ++              DEPENDS ${PRJ_SRPM_FILE} ${PRJ_RPM_FILES}
> > ++              )
> > ++
> > ++          ADD_CUSTOM_TARGET(clean_old_rpm
> > ++              COMMAND find .
> > ++              -name '${PROJECT_NAME}*.rpm' ! -name '${PROJECT_NAME}*-=
${PRJ_VER}-${PRJ_RELEASE_NO}.*.rpm'
> > ++              -print -delete
> > ++              COMMAND find ${RPM_BUILD_BUILD}
> > ++              -path '${PROJECT_NAME}*' ! -path '${RPM_BUILD_BUILD}/${=
PROJECT_NAME}-${PRJ_VER}-*'
> > ++              -print -delete
> > ++              COMMENT "Cleaning old rpms and build."
> > ++              )
> > ++
> > ++          ADD_CUSTOM_TARGET(clean_old_pkg
> > ++              )
> > ++
> > ++          ADD_DEPENDENCIES(clean_old_pkg clean_old_rpm clean_old_pack=
_src)
> > ++
> > ++          ADD_CUSTOM_TARGET(clean_rpm
> > ++              COMMAND find . -name '${PROJECT_NAME}-*.rpm' -print -de=
lete
> > ++              COMMENT "Cleaning rpms.."
> > ++              )
> > ++          ADD_CUSTOM_TARGET(clean_pkg
> > ++              )
> > ++
> > ++          ADD_DEPENDENCIES(clean_rpm clean_old_rpm)
> > ++          ADD_DEPENDENCIES(clean_pkg clean_rpm clean_pack_src)
> > ++      ENDIF(NOT _manage_rpm_dependency_missing )
> > ++    ENDMACRO(PACK_RPM)
> > ++
> > ++    MACRO(RPM_MOCK_BUILD)
> > ++      IF(NOT _manage_rpm_dependency_missing )
> > ++          FIND_PROGRAM(MOCK_CMD mock)
> > ++          IF(MOCK_CMD STREQUAL "MOCK_CMD-NOTFOUND")
> > ++              M_MSG(${M_OFF} "mock is not found in PATH, mock support=
 disabled.")
> > ++          ELSE(MOCK_CMD STREQUAL "MOCK_CMD-NOTFOUND")
> > ++              IF(NOT PRJ_RPM_BUILD_ARCH STREQUAL "noarch")
> > ++                  IF(NOT DEFINED MOCK_RPM_DIST_TAG)
> > ++                      STRING(REGEX MATCH "^fc([1-9][0-9]*)"  _fedora_=
mock_dist "${RPM_DIST_TAG}")
> > ++                      STRING(REGEX MATCH "^el([1-9][0-9]*)"  _el_mock=
_dist "${RPM_DIST_TAG}")
> > ++
> > ++                      IF (_fedora_mock_dist)
> > ++                          STRING(REGEX REPLACE "^fc([1-9][0-9]*)" "fe=
dora-\\1" MOCK_RPM_DIST_TAG "${RPM_DIST_TAG}")
> > ++                      ELSEIF (_el_mock_dist)
> > ++                          STRING(REGEX REPLACE "^el([1-9][0-9]*)" "ep=
el-\\1" MOCK_RPM_DIST_TAG "${RPM_DIST_TAG}")
> > ++                      ELSE (_fedora_mock_dist)
> > ++                          SET(MOCK_RPM_DIST_TAG "fedora-devel")
> > ++                      ENDIF(_fedora_mock_dist)
> > ++                  ENDIF(NOT DEFINED MOCK_RPM_DIST_TAG)
> > ++
> > ++                  #MESSAGE ("MOCK_RPM_DIST_TAG=3D${MOCK_RPM_DIST_TAG}=
")
> > ++                  ADD_CUSTOM_TARGET(rpm_mock_i386
> > ++                      COMMAND ${CMAKE_COMMAND} -E make_directory ${RP=
M_BUILD_RPMS}/i386
> > ++                      COMMAND ${MOCK_CMD} -r  "${MOCK_RPM_DIST_TAG}-i=
386" --resultdir=3D"${RPM_BUILD_RPMS}/i386" ${PRJ_SRPM_FILE}
> > ++                      DEPENDS ${PRJ_SRPM_FILE}
> > ++                      )
> > ++
> > ++                  ADD_CUSTOM_TARGET(rpm_mock_x86_64
> > ++                      COMMAND ${CMAKE_COMMAND} -E make_directory ${RP=
M_BUILD_RPMS}/x86_64
> > ++                      COMMAND ${MOCK_CMD} -r  "${MOCK_RPM_DIST_TAG}-x=
86_64" --resultdir=3D"${RPM_BUILD_RPMS}/x86_64" ${PRJ_SRPM_FILE}
> > ++                      DEPENDS ${PRJ_SRPM_FILE}
> > ++                      )
> > ++              ENDIF(NOT PRJ_RPM_BUILD_ARCH STREQUAL "noarch")
> > ++          ENDIF(MOCK_CMD STREQUAL "MOCK_CMD-NOTFOUND")
> > ++      ENDIF(NOT _manage_rpm_dependency_missing )
> > ++
> > ++    ENDMACRO(RPM_MOCK_BUILD)
> > ++
> > ++ENDIF(NOT DEFINED _MANAGE_RPM_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageRelease.cmake
> > +@@ -0,0 +1,57 @@
> > ++# - Module that perform release task.
> > ++# This module provides common targets for release or post-release cho=
res.
> > ++#
> > ++#  Defines following macros:
> > ++#  MANAGE_RELEASE(releaseTargets)
> > ++#  - Run release targets and the target "after_release_commit".
> > ++#    This macro skips the missing targets so distro package maintaine=
rs
> > ++#    do not have to get the irrelevant dependencies.
> > ++#    For the "hard" requirement, please use cmake command
> > ++#      "ADD_DEPENDENCIES".
> > ++#    Arguments:
> > ++#    + releaseTargets: Targets need to be done for a release.
> > ++#      Note that sequence of the targets does not guarantee the
> > ++#      sequence of execution.
> > ++#    Defines following targets:
> > ++#    + release: Perform everything required for a release.
> > ++#      Reads following variables:
> > ++#      + RELEASE_DEPENDS_FILES: List of files that the release depend=
s.
> > ++#        Note that the sequence of the target does not guarantee the
> > ++#        sequence of execution.
> > ++#
> > ++
> > ++IF(NOT DEFINED _MANAGE_RELEASE_CMAKE_)
> > ++    SET(_MANAGE_RELEASE_CMAKE_ "DEFINED")
> > ++    INCLUDE(ManageMessage)
> > ++
> > ++    MACRO(MANAGE_RELEASE)
> > ++      ## Target: release
> > ++      ADD_CUSTOM_TARGET(release
> > ++          DEPENDS ${RELEASE_DEPENDS_FILES}
> > ++          COMMENT "Releasing ${PROJECT_NAME}-${PRJ_VER}"
> > ++          )
> > ++
> > ++      ## Remove the missing targets
> > ++      SET(_releaseTargets "")
> > ++      FOREACH(_target ${ARGN})
> > ++          IF(TARGET ${_target})
> > ++              LIST(APPEND _releaseTargets "${_target}")
> > ++          ELSE(TARGET ${_target})
> > ++              M_MSG(${M_OFF} "Target ${_target} does not exist, skipp=
ed.")
> > ++          ENDIF(TARGET ${_target})
> > ++      ENDFOREACH(_target ${ARGN})
> > ++
> > ++      IF(_releaseTargets)
> > ++          ADD_DEPENDENCIES(release ${_releaseTargets})
> > ++      ENDIF(_releaseTargets)
> > ++
> > ++      ## Run after release
> > ++      #ADD_CUSTOM_COMMAND(TARGET release
> > ++      #    POST_BUILD
> > ++      #    COMMAND make after_release_commit
> > ++      #    COMMENT "After released ${PROJECT_NAME}-${PRJ_VER}"
> > ++      #    )
> > ++
> > ++    ENDMACRO(MANAGE_RELEASE)
> > ++ENDIF(NOT DEFINED _MANAGE_RELEASE_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageReleaseFedora.cmake
> > +@@ -0,0 +1,381 @@
> > ++# - Module for working with Fedora and EPEL releases.
> > ++#
> > ++# This module provides convenient targets and macros for Fedora and E=
PEL
> > ++# releases by using fedpkg, koji, and bodhi
> > ++#
> > ++# This module check following files for dependencies:
> > ++#  1. ~/.fedora-upload-ca.cert : Ensure it has certificate file to su=
bmit to Fedora.
> > ++#  2. fedpkg : Required to submit to fedora.
> > ++#  3. koji : Required to submit to fedora.
> > ++#  4. bodhi : Required to submit to fedora.
> > ++#
> > ++#  If on of above file is missing, this module will be skipped.
> > ++#
> > ++# This module read the supported release information from cmake-fedor=
a.conf
> > ++# It finds cmake-fedora.conf in following order:
> > ++# 1. Current directory
> > ++# 2. Path as defined CMAKE_SOURCE_DIR
> > ++# 3. /etc/cmake-fedora.conf
> > ++#
> > ++# Includes:
> > ++#   ManageMessage
> > ++#
> > ++# Defines following variables:
> > ++#    CMAKE_FEDORA_CONF: Path to cmake_fedora.conf
> > ++#    FEDPKG_CMD: Path to fedpkg
> > ++#    KOJI_CMD: Path to koji
> > ++#    GIT_CMD: Path to git
> > ++#    BODHI_CMD: Path to bodhi
> > ++#    KOJI_BUILD_SCRATCH_CMD: Path to koji-build-scratch
> > ++#    FEDORA_RAWHIDE_VER: Fedora Rawhide version.
> > ++#    FEDORA_SUPPORTED_VERS: Fedora supported versions.
> > ++#    EPEL_SUPPORTED_VERS: EPEL supported versions.
> > ++#    FEDPKG_DIR: Dir for fedpkg
> > ++#    FEDORA_KAMA: Fedora Karma. Default:3
> > ++#    FEDORA_UNSTABLE_KARMA: Fedora unstable Karma. Default:3
> > ++#    FEDORA_AUTO_KARMA: Whether to use fedora Karma system. Default:"=
True"
> > ++#
> > ++# Defines following functions:
> > ++#   RELEASE_FEDORA(tagList)
> > ++#   - Release this project to specified Fedora and EPEL releases.
> > ++#     Arguments:
> > ++#     + tagList: Fedora and EPEL dist tags that this project submit t=
o.
> > ++#       E.g. "f18", "f17", "el7"
> > ++#       You can also specify "fedora" for fedora current releases,
> > ++#       and/or "epel" for EPEL current releases.
> > ++#
> > ++#     Reads following variables:
> > ++#     + PRJ_SRPM_FILE: Project SRPM
> > ++#     + FEDPKG_DIR: Directory for fedpkg checkout.
> > ++#       Default: FedPkg.
> > ++#     Reads and define following variables:
> > ++#     + FEDORA_RAWHIDE_VER: Numeric version of rawhide, such as 18
> > ++#     + FEDORA_SUPPORTED_VERS: Numeric versions of currently supporte=
d Fedora,
> > ++#       such as 17;16
> > ++#     + EPEL_SUPPORTED_VERS: Numeric versions of currently supported =
EPEL
> > ++#       since version 5. Such as 6;5
> > ++#     + FEDORA_KARMA: Karma for auto pushing.
> > ++#       Default: 3
> > ++#     + FEDORA_UNSTABLE_KARMA: Karma for auto unpushing.
> > ++#       Default: 3
> > ++#     + FEDORA_AUTO_KARMA: Whether to enable auto pushing/unpushing
> > ++#       Default: True
> > ++#     Defines following targets:
> > ++#     + release_fedora: Make necessary steps for releasing on fedora,
> > ++#       such as making source file tarballs, source rpms, build with =
fedpkg
> > ++#       and upload to bodhi.
> > ++#     + bodhi_new: Submit the package to bodhi
> > ++#     + fedpkg_<tag>_build: Build for tag
> > ++#     + fedpkg_<tag>_commit: Import, commit and push
> > ++#     + koji_build_scratch: Scratch build using koji
> > ++#
> > ++#
> > ++
> > ++IF(NOT DEFINED _MANAGE_RELEASE_FEDORA_)
> > ++    SET(_MANAGE_RELEASE_FEDORA_ "DEFINED")
> > ++    INCLUDE(ManageMessage)
> > ++    INCLUDE(ManageTarget)
> > ++    SET(_manage_release_fedora_dependencies_missing 0)
> > ++    SET(KOJI_BUILD_SCRATCH "koji-build-scratch" CACHE INTERNAL "Koji =
build scratch name")
> > ++
> > ++    FIND_FILE(CMAKE_FEDORA_CONF cmake-fedora.conf "." "${CMAKE_SOURCE=
_DIR}" "${SYSCONF_DIR}")
> > ++    M_MSG(${M_INFO1} "CMAKE_FEDORA_CONF=3D${CMAKE_FEDORA_CONF}")
> > ++    IF("${CMAKE_FEDORA_CONF}" STREQUAL "CMAKE_FEDORA_CONF-NOTFOUND")
> > ++      M_MSG(${M_OFF} "cmake-fedora.conf cannot be found! Fedora relea=
se support disabled.")
> > ++      SET(_manage_release_fedora_dependencies_missing 1)
> > ++    ENDIF("${CMAKE_FEDORA_CONF}" STREQUAL "CMAKE_FEDORA_CONF-NOTFOUND=
")
> > ++
> > ++    FIND_PROGRAM(FEDPKG_CMD fedpkg)
> > ++    IF(FEDPKG_CMD STREQUAL "FEDPKG_CMD-NOTFOUND")
> > ++      M_MSG(${M_OFF} "Program fedpkg is not found! Fedora support dis=
abled.")
> > ++      SET(_manage_release_fedora_dependencies_missing 1)
> > ++    ENDIF(FEDPKG_CMD STREQUAL "FEDPKG_CMD-NOTFOUND")
> > ++
> > ++    FIND_PROGRAM(KOJI_CMD koji)
> > ++    IF(KOJI_CMD STREQUAL "KOJI_CMD-NOTFOUND")
> > ++      M_MSG(${M_OFF} "Program koji is not found! Koji support disable=
d.")
> > ++    ENDIF(KOJI_CMD STREQUAL "KOJI_CMD-NOTFOUND")
> > ++
> > ++    FIND_PROGRAM(GIT_CMD git)
> > ++    IF(FEDPKG_CMD STREQUAL "FEDPKG_CMD-NOTFOUND")
> > ++      M_MSG(${M_OFF} "Program git is not found! Fedora support disabl=
ed.")
> > ++      SET(_manage_release_fedora_dependencies_missing 1)
> > ++    ENDIF(FEDPKG_CMD STREQUAL "FEDPKG_CMD-NOTFOUND")
> > ++
> > ++    FIND_PROGRAM(BODHI_CMD bodhi)
> > ++    IF(BODHI_CMD STREQUAL "BODHI_CMD-NOTFOUND")
> > ++      M_MSG(${M_OFF} "Program bodhi is not found! Bodhi support disab=
led.")
> > ++    ENDIF(BODHI_CMD STREQUAL "BODHI_CMD-NOTFOUND")
> > ++
> > ++
> > ++    ## Set variables
> > ++    IF(NOT _manage_release_fedora_dependencies_missing)
> > ++      # Set release tags according to CMAKE_FEDORA_CONF
> > ++      SETTING_FILE_GET_ALL_VARIABLES(${CMAKE_FEDORA_CONF})
> > ++
> > ++      SET(FEDORA_RAWHIDE_VER "${FEDORA_RAWHIDE_VERSION}"
> > ++          CACHE STRING "Fedora Rawhide ver" FORCE)
> > ++      STRING_SPLIT(_FEDORA_SUPPORTED_VERS " " ${FEDORA_SUPPORTED_VERS=
IONS})
> > ++      SET(FEDORA_SUPPORTED_VERS ${_FEDORA_SUPPORTED_VERS}
> > ++          CACHE STRING "Fedora supported vers" FORCE)
> > ++
> > ++      STRING_SPLIT(_EPEL_SUPPORTED_VERS " " ${EPEL_SUPPORTED_VERSIONS=
})
> > ++      SET(EPEL_SUPPORTED_VERS ${_EPEL_SUPPORTED_VERS}
> > ++          CACHE STRING "EPEL supported vers" FORCE)
> > ++
> > ++      SET(FEDORA_KOJI_TAG_POSTFIX "" CACHE STRING "Koji Fedora tag pr=
efix")
> > ++      SET(EPEL_KOJI_TAG_POSTFIX "-testing-candidate"
> > ++          CACHE STRING "Koji EPEL tag prefix")
> > ++
> > ++      SET(BODHI_TEMPLATE_FILE "${CMAKE_FEDORA_TMP_DIR}/bodhi.template=
"
> > ++          CACHE FILEPATH "Bodhi template file"
> > ++          )
> > ++
> > ++      SET(FEDPKG_DIR "${CMAKE_BINARY_DIR}/FedPkg" CACHE PATH "FedPkg =
dir")
> > ++      FILE(MAKE_DIRECTORY ${FEDPKG_DIR})
> > ++
> > ++      GET_FILENAME_COMPONENT(_FEDPKG_DIR_NAME ${FEDPKG_DIR} NAME)
> > ++      LIST(APPEND SOURCE_ARCHIVE_IGNORE_FILES "/${_FEDPKG_DIR_NAME}/"=
)
> > ++
> > ++      ## Fedora package variables
> > ++      SET(FEDORA_KARMA "3" CACHE STRING "Fedora Karma")
> > ++      SET(FEDORA_UNSTABLE_KARMA "-3" CACHE STRING "Fedora unstable Ka=
rma")
> > ++      SET(FEDORA_AUTO_KARMA "True" CACHE STRING "Fedora auto Karma")
> > ++
> > ++      FIND_PROGRAM(KOJI_BUILD_SCRATCH_CMD ${KOJI_BUILD_SCRATCH} PATHS=
 ${CMAKE_BINARY_DIR}/scripts . )
> > ++      IF(KOJI_BUILD_SCRATCH_CMD STREQUAL "KOJI_BUILD_SCRATCH_CMD-NOTF=
OUND")
> > ++          M_MSG(${M_OFF} "Program koji_build_scratch is not found!")
> > ++      ENDIF(KOJI_BUILD_SCRATCH_CMD STREQUAL "KOJI_BUILD_SCRATCH_CMD-N=
OTFOUND")
> > ++
> > ++      SET(FEDPKG_PRJ_DIR "${FEDPKG_DIR}/${PROJECT_NAME}")
> > ++
> > ++      ## Don't use what is in git, otherwise it will be cleaned
> > ++      ## By make clean
> > ++      SET(FEDPKG_PRJ_DIR_GIT "${FEDPKG_PRJ_DIR}/.git/.cmake-fedora")
> > ++
> > ++      ADD_CUSTOM_COMMAND(OUTPUT ${FEDPKG_PRJ_DIR_GIT}
> > ++          COMMAND [ -d ${FEDPKG_PRJ_DIR} ] || ${FEDPKG_CMD} clone ${P=
ROJECT_NAME}
> > ++          COMMAND ${CMAKE_COMMAND} -E touch ${FEDPKG_PRJ_DIR_GIT}
> > ++          COMMENT "Making FedPkg directory"
> > ++          WORKING_DIRECTORY ${FEDPKG_DIR}
> > ++          VERBATIM
> > ++          )
> > ++
> > ++    ENDIF(NOT _manage_release_fedora_dependencies_missing)
> > ++
> > ++    FUNCTION(RELEASE_ADD_KOJI_BUILD_SCRATCH)
> > ++      IF(NOT _manage_release_fedora_dependencies_missing)
> > ++          ADD_CUSTOM_TARGET(koji_build_scratch
> > ++              COMMAND ${KOJI_BUILD_SCRATCH_CMD} ${PRJ_SRPM_FILE} ${AR=
GN}
> > ++              DEPENDS "${PRJ_SRPM_FILE}"
> > ++              COMMENT "koji scratch build on ${PRJ_SRPM_FILE}"
> > ++              VERBATIM
> > ++              )
> > ++      ENDIF(NOT _manage_release_fedora_dependencies_missing)
> > ++      ADD_DEPENDENCIES(koji_build_scratch rpmlint)
> > ++      ADD_DEPENDENCIES(tag_pre koji_build_scratch)
> > ++    ENDFUNCTION(RELEASE_ADD_KOJI_BUILD_SCRATCH)
> > ++
> > ++    # Convert fedora koji tag to bodhi tag
> > ++    FUNCTION(_RELEASE_TO_BODHI_TAG bodhiTag tag)
> > ++      STRING(REGEX REPLACE "f([0-9]+)" "fc\\1" _tag_replace "${tag}")
> > ++      IF(_tag_replace STREQUAL "")
> > ++          SET(${bodhiTag} "${tag}" PARENT_SCOPE)
> > ++      ELSE(_tag_replace STREQUAL "")
> > ++          SET(${bodhiTag} "${_tag_replace}" PARENT_SCOPE)
> > ++      ENDIF(_tag_replace STREQUAL "")
> > ++    ENDFUNCTION(_RELEASE_TO_BODHI_TAG bodhiTag tag)
> > ++
> > ++    FUNCTION(RELEASE_ADD_FEDPKG_TARGETS tag)
> > ++      IF(NOT _manage_release_fedora_dependencies_missing)
> > ++          SET(_branch ${tag})
> > ++          IF("${tag}" STREQUAL "f${FEDORA_RAWHIDE_VER}")
> > ++              SET(_branch "master")
> > ++          ENDIF("${tag}" STREQUAL "f${FEDORA_RAWHIDE_VER}")
> > ++
> > ++          _RELEASE_TO_BODHI_TAG(_bodhi_tag "${tag}")
> > ++
> > ++          ## Fedpkg import and commit
> > ++          SET(_import_opt "")
> > ++          IF(NOT ver EQUAL FEDORA_RAWHIDE_VER)
> > ++              SET(_import_opt "-b ${tag}")
> > ++          ENDIF(NOT ver EQUAL FEDORA_RAWHIDE_VER)
> > ++
> > ++          #Commit summary
> > ++          IF (DEFINED CHANGE_SUMMARY)
> > ++              SET (COMMIT_MSG  "-m" "${CHANGE_SUMMARY}")
> > ++          ELSE(DEFINED CHANGE_SUMMARY)
> > ++              SET (COMMIT_MSG  "-m"  "On releasing ${PRJ_VER}-${PRJ_R=
ELEASE_NO}")
> > ++          ENDIF(DEFINED CHANGE_SUMMARY)
> > ++          # Depends on tag file instead of target "tag"
> > ++          # To avoid excessive scratch build and rpmlint
> > ++          SET(_commit_opt --push --tag )
> > ++
> > ++          SET(_fedpkg_nvrd "${PROJECT_NAME}-${PRJ_VER}-${PRJ_RELEASE_=
NO}.${_bodhi_tag}")
> > ++          SET(_fedpkg_nvrd_commit_file
> > ++              "${CMAKE_FEDORA_TMP_DIR}/${_fedpkg_nvrd}.commit")
> > ++
> > ++          IF(_branch STREQUAL "master")
> > ++              # Can't use ADD_CUSTOM_TARGET_COMMAND here, as the COMM=
IT_SUMMARY may have semi-colon ':'
> > ++              ADD_CUSTOM_COMMAND(OUTPUT "${FEDPKG_NVR_RAWHIDE_COMMIT_=
FILE}"
> > ++                  COMMAND test -d ${PROJECT_NAME} || ${FEDPKG_CMD} cl=
one ${PROJECT_NAME}
> > ++                  COMMAND ${FEDPKG_CMD} switch-branch ${_branch}
> > ++                  COMMAND ${GIT_CMD} pull --all
> > ++                  COMMAND ${FEDPKG_CMD} import "${PRJ_SRPM_FILE}"
> > ++                  COMMAND ${FEDPKG_CMD} commit ${_commit_opt} -m "${C=
HANGE_SUMMARY}"
> > ++                  COMMAND ${GIT_CMD} push --all
> > ++                  COMMAND ${CMAKE_COMMAND} -E touch "${FEDPKG_NVR_RAW=
HIDE_COMMIT_FILE}"
> > ++                  DEPENDS "${FEDPKG_PRJ_DIR_GIT}" "${MANAGE_SOURCE_VE=
RSION_CONTROL_TAG_FILE}" "${PRJ_SRPM_FILE}"
> > ++                  WORKING_DIRECTORY ${FEDPKG_PRJ_DIR}
> > ++                  COMMENT "fedpkg commit on ${_branch} with ${PRJ_SRP=
M_FILE}"
> > ++                  VERBATIM
> > ++                  )
> > ++
> > ++              ADD_CUSTOM_TARGET(fedpkg_${_branch}_commit
> > ++                  DEPENDS ${FEDPKG_NVR_RAWHIDE_COMMIT_FILE}
> > ++                  )
> > ++          ELSE(_branch STREQUAL "master")
> > ++              ADD_CUSTOM_COMMAND(OUTPUT "${_fedpkg_nvrd_commit_file}"
> > ++                  COMMAND ${FEDPKG_CMD} switch-branch ${_branch}
> > ++                  COMMAND ${GIT_CMD} pull
> > ++                  COMMAND ${GIT_CMD} merge -m "Merge branch 'master' =
into ${_branch}" master
> > ++                  COMMAND ${FEDPKG_CMD} push
> > ++                  COMMAND ${CMAKE_COMMAND} -E touch "${_fedpkg_nvrd_c=
ommit_file}"
> > ++                  DEPENDS "${FEDPKG_NVR_RAWHIDE_COMMIT_FILE}"
> > ++                  WORKING_DIRECTORY ${FEDPKG_PRJ_DIR}
> > ++                  COMMENT "fedpkg commit on ${_branch} with ${PRJ_SRP=
M_FILE}"
> > ++                  VERBATIM
> > ++                  )
> > ++
> > ++              ADD_CUSTOM_TARGET(fedpkg_${_branch}_commit
> > ++                  DEPENDS "${_fedpkg_nvrd_commit_file}"
> > ++                  )
> > ++          ENDIF(_branch STREQUAL "master")
> > ++
> > ++          ## Fedpkg build
> > ++          SET(_fedpkg_nvrd_build_file
> > ++              "${CMAKE_FEDORA_TMP_DIR}/${_fedpkg_nvrd}")
> > ++
> > ++          ADD_CUSTOM_COMMAND(OUTPUT "${_fedpkg_nvrd_build_file}"
> > ++              COMMAND ${FEDPKG_CMD} switch-branch ${_branch}
> > ++              COMMAND ${FEDPKG_CMD} build
> > ++              COMMAND ${CMAKE_COMMAND} -E touch "${_fedpkg_nvrd_build=
_file}"
> > ++              DEPENDS "${_fedpkg_nvrd_commit_file}"
> > ++              WORKING_DIRECTORY ${FEDPKG_PRJ_DIR}
> > ++              COMMENT "fedpkg build on ${_branch}"
> > ++              VERBATIM
> > ++              )
> > ++
> > ++          ADD_CUSTOM_TARGET(fedpkg_${_branch}_build
> > ++              DEPENDS "${_fedpkg_nvrd_build_file}"
> > ++              )
> > ++
> > ++          ADD_DEPENDENCIES(bodhi_new fedpkg_${_branch}_build)
> > ++
> > ++          ## Fedpkg update
> > ++          SET(_fedpkg_nvrd_update_file
> > ++              "${CMAKE_FEDORA_TMP_DIR}/${_fedpkg_nvrd}.update")
> > ++
> > ++          ADD_CUSTOM_TARGET_COMMAND(fedpkg_${_branch}_update
> > ++              OUTPUT "${_fedpkg_nvrd_update_file}"
> > ++              COMMAND ${FEDPKG_CMD} switch-branch ${_branch}
> > ++              COMMAND ${FEDPKG_CMD} update
> > ++              COMMAND ${CMAKE_COMMAND} -E touch "${_fedpkg_nvrd_build=
_file}"
> > ++              DEPENDS ${_fedpkg_nvrd_build_file}
> > ++              WORKING_DIRECTORY ${FEDPKG_PRJ_DIR}
> > ++              COMMENT "fedpkg build on ${_branch}"
> > ++              VERBATIM
> > ++              )
> > ++
> > ++      ENDIF(NOT _manage_release_fedora_dependencies_missing)
> > ++    ENDFUNCTION(RELEASE_ADD_FEDPKG_TARGETS tag)
> > ++
> > ++    MACRO(_append_notes _file)
> > ++      STRING(REGEX REPLACE "\n" "\n " _notes "${CHANGELOG_ITEMS}")
> > ++      FILE(APPEND "${_file}" "notes=3D${_notes}\n\n")
> > ++    ENDMACRO(_append_notes _file)
> > ++
> > ++    FUNCTION(RELEASE_APPEND_BODHI_FILE tag)
> > ++      IF(NOT _manage_release_fedora_dependencies_missing)
> > ++          # Rawhide does not go to bodhi
> > ++          IF(NOT "${tag}" STREQUAL "f${FEDORA_RAWHIDE_VER}")
> > ++              _RELEASE_TO_BODHI_TAG(_bodhi_tag "${tag}")
> > ++
> > ++              FILE(APPEND ${BODHI_TEMPLATE_FILE} "[${PROJECT_NAME}-${=
PRJ_VER}-${PRJ_RELEASE_NO}.${_bodhi_tag}]\n\n")
> > ++
> > ++              IF(BODHI_UPDATE_TYPE)
> > ++                  FILE(APPEND ${BODHI_TEMPLATE_FILE} "type=3D${BODHI_=
UPDATE_TYPE}\n\n")
> > ++              ELSE(BODHI_UPDATE_TYPE)
> > ++                  FILE(APPEND ${BODHI_TEMPLATE_FILE} "type=3Dbugfix\n=
\n")
> > ++              ENDIF(BODHI_UPDATE_TYPE)
> > ++
> > ++              FILE(APPEND ${BODHI_TEMPLATE_FILE} "request=3Dtesting\n=
")
> > ++              FILE(APPEND ${BODHI_TEMPLATE_FILE} "bugs=3D${REDHAT_BUG=
ZILLA}\n")
> > ++
> > ++              _append_notes(${BODHI_TEMPLATE_FILE})
> > ++
> > ++              FILE(APPEND ${BODHI_TEMPLATE_FILE} "autokarma=3D${FEDOR=
A_AUTO_KARMA}\n")
> > ++              FILE(APPEND ${BODHI_TEMPLATE_FILE} "stable_karma=3D${FE=
DORA_KARMA}\n")
> > ++              FILE(APPEND ${BODHI_TEMPLATE_FILE} "unstable_karma=3D${=
FEDORA_UNSTABLE_KARMA}\n")
> > ++              FILE(APPEND ${BODHI_TEMPLATE_FILE} "close_bugs=3DTrue\n=
")
> > ++
> > ++              IF(SUGGEST_REBOOT)
> > ++                  FILE(APPEND ${BODHI_TEMPLATE_FILE} "suggest_reboot=
=3DTrue\n")
> > ++              ELSE(SUGGEST_REBOOT)
> > ++                  FILE(APPEND ${BODHI_TEMPLATE_FILE} "suggest_reboot=
=3DFalse\n\n")
> > ++              ENDIF(SUGGEST_REBOOT)
> > ++          ENDIF(NOT "${tag}" STREQUAL "f${FEDORA_RAWHIDE_VER}")
> > ++      ENDIF(NOT _manage_release_fedora_dependencies_missing)
> > ++    ENDFUNCTION(RELEASE_APPEND_BODHI_FILE tag)
> > ++
> > ++    FUNCTION(RELEASE_FEDORA)
> > ++      IF(NOT _manage_release_fedora_dependencies_missing)
> > ++          ## Parse tags
> > ++          SET(_build_list "f${FEDORA_RAWHIDE_VER}")
> > ++          FOREACH(_rel ${ARGN})
> > ++              IF(_rel STREQUAL "fedora")
> > ++                  FOREACH(_ver ${FEDORA_SUPPORTED_VERS})
> > ++                      LIST(APPEND _build_list "f${_ver}")
> > ++                  ENDFOREACH(_ver ${FEDORA_SUPPORTED_VERS})
> > ++              ELSEIF(_rel STREQUAL "epel")
> > ++                  FOREACH(_ver ${EPEL_SUPPORTED_VERS})
> > ++                      LIST(APPEND _build_list "el${_ver}")
> > ++                  ENDFOREACH(_ver ${FEDORA_SUPPORTED_VERS})
> > ++              ELSE(_rel STREQUAL "fedora")
> > ++                  LIST(APPEND _build_list "${_rel}")
> > ++              ENDIF(_rel STREQUAL "fedora")
> > ++          ENDFOREACH(_rel ${ARGN})
> > ++          LIST(REMOVE_DUPLICATES _build_list)
> > ++
> > ++          IF(BODHI_USER)
> > ++              SET(_bodhi_login "-u ${BODHI_USER}")
> > ++          ENDIF(BODHI_USER)
> > ++
> > ++          ADD_CUSTOM_TARGET(bodhi_new
> > ++              COMMAND ${BODHI_CMD} --new ${_bodhi_login} --file ${BOD=
HI_TEMPLATE_FILE}
> > ++              DEPENDS "${BODHI_TEMPLATE_FILE}"
> > ++              COMMENT "Submit new release to bodhi (Fedora)"
> > ++              VERBATIM
> > ++              )
> > ++
> > ++          # NVRD: Name-Version-Release-Dist
> > ++          SET(FEDPKG_NVR_RAWHIDE "${PROJECT_NAME}-${PRJ_VER}-${PRJ_RE=
LEASE_NO}.fc${FEDORA_RAWHIDE_VER}")
> > ++          SET(FEDPKG_NVR_RAWHIDE_COMMIT_FILE "${CMAKE_FEDORA_TMP_DIR}=
/${FEDPKG_NVR_RAWHIDE}.commit")
> > ++
> > ++          ## Create targets
> > ++          FILE(REMOVE "${BODHI_TEMPLATE_FILE}")
> > ++          RELEASE_ADD_KOJI_BUILD_SCRATCH(${_build_list})
> > ++          FOREACH(_tag ${_build_list})
> > ++              RELEASE_ADD_FEDPKG_TARGETS("${_tag}")
> > ++              RELEASE_APPEND_BODHI_FILE("${_tag}")
> > ++          ENDFOREACH(_tag ${_build_list})
> > ++
> > ++          ADD_CUSTOM_TARGET(release_fedora
> > ++              COMMENT "Release for Fedora")
> > ++
> > ++          ADD_DEPENDENCIES(release_fedora bodhi_new)
> > ++
> > ++      ENDIF(NOT _manage_release_fedora_dependencies_missing)
> > ++    ENDFUNCTION(RELEASE_FEDORA)
> > ++ENDIF(NOT DEFINED _MANAGE_RELEASE_FEDORA_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageSourceVersionControl.cmake
> > +@@ -0,0 +1,137 @@
> > ++# - Module for manipulate source version control systems.
> > ++# This module provides an universal interface for supported
> > ++# source version control systems, namely:
> > ++# Git, Mercurial and SVN.
> > ++#
> > ++# Following targets are defined for each source version control (in G=
it terminology):
> > ++#   - tag: Tag the working tree with PRJ_VER and CHANGE_SUMMARY.
> > ++#     This target also does:
> > ++#     1. Ensure there is nothing uncommitted.
> > ++#     2. Push the commits and tags to server
> > ++#   - tag_pre: Targets that 'tag' depends on.
> > ++#     So you can push some check before the tag.
> > ++#   - after_release_commit:
> > ++#     This target does some post release chores, such as
> > ++#     updating ChangeLog.prev and RPM-ChangeLog.prev, then push them =
to server.
> > ++#
> > ++# Following variables are defined for each source version control:
> > ++#   - MANAGE_SOURCE_VERSION_CONTROL_TAG_FILE:
> > ++#     The file that would be touched after target tag is completed.
> > ++#
> > ++#
> > ++
> > ++IF(NOT DEFINED _MANAGE_SOURCE_VERSION_CONTROL_CMAKE_)
> > ++    SET(_MANAGE_SOURCE_VERSION_CONTROL_CMAKE_ "DEFINED")
> > ++    SET(_after_release_message "After released ${PRJ_VER}")
> > ++    INCLUDE(ManageTarget)
> > ++
> > ++    MACRO(MANAGE_SOURCE_VERSION_CONTROL_COMMON)
> > ++      ADD_CUSTOM_TARGET(tag_pre
> > ++          COMMENT "Pre-tagging check"
> > ++          )
> > ++
> > ++
> > ++      ADD_CUSTOM_TARGET(after_release_commit_pre
> > ++          COMMENT "Before 'after_release_commit'"
> > ++          )
> > ++
> > ++      IF(TARGET changelog_prev_update)
> > ++          ADD_DEPENDENCIES(after_release_commit_pre changelog_prev_up=
date)
> > ++      ENDIF(TARGET changelog_prev_update)
> > ++
> > ++      IF(TARGET rpm_changelog_prev_update)
> > ++          ADD_DEPENDENCIES(after_release_commit_pre rpm_changelog_pre=
v_update)
> > ++      ENDIF(TARGET rpm_changelog_prev_update)
> > ++    ENDMACRO(MANAGE_SOURCE_VERSION_CONTROL_COMMON)
> > ++
> > ++    MACRO(MANAGE_SOURCE_VERSION_CONTROL_GIT)
> > ++      SET(MANAGE_SOURCE_VERSION_CONTROL_TAG_FILE
> > ++          ${CMAKE_SOURCE_DIR}/.git/refs/tags/${PRJ_VER}
> > ++          CACHE PATH "Source Version Control Tag File" FORCE)
> > ++
> > ++      ADD_CUSTOM_TARGET(after_release_commit
> > ++          COMMAND make after_release_commit_pre
> > ++          COMMAND git commit -a -m "${_after_release_message}"
> > ++          COMMAND git push
> > ++          COMMENT "After released ${PRJ_VER}"
> > ++          VERBATIM
> > ++          )
> > ++
> > ++      # Can't use ADD_CUSTOM_TARGET here, as the COMMIT_SUMMARY may h=
ave semi-colon ':'
> > ++      ADD_CUSTOM_TARGET(tag
> > ++          DEPENDS "${MANAGE_SOURCE_VERSION_CONTROL_TAG_FILE}"
> > ++          )
> > ++
> > ++      ADD_CUSTOM_TARGET(commit_clean
> > ++          COMMAND git diff --exit-code
> > ++          COMMENT "Is git commit clean?"
> > ++          VERBATIM
> > ++          )
> > ++
> > ++      ADD_CUSTOM_COMMAND(OUTPUT ${MANAGE_SOURCE_VERSION_CONTROL_TAG_F=
ILE}
> > ++          COMMAND make commit_clean
> > ++          COMMAND make tag_pre
> > ++          COMMAND git tag -a -m "${CHANGE_SUMMARY}" "${PRJ_VER}" HEAD
> > ++          COMMENT "Tagging the source as ver ${PRJ_VER}"
> > ++          VERBATIM
> > ++          )
> > ++      MANAGE_SOURCE_VERSION_CONTROL_COMMON()
> > ++    ENDMACRO(MANAGE_SOURCE_VERSION_CONTROL_GIT)
> > ++
> > ++    MACRO(MANAGE_SOURCE_VERSION_CONTROL_HG)
> > ++      SET(MANAGE_SOURCE_VERSION_CONTROL_TAG_FILE
> > ++          ${CMAKE_FEDORA_TEMP_DIR}/${PRJ_VER}
> > ++          CACHE PATH "Source Version Control Tag File" FORCE)
> > ++
> > ++      ADD_CUSTOM_TARGET(after_release_commit
> > ++          COMMAND make after_release_commit_pre
> > ++          COMMAND hg commit -m "${_after_release_message}"
> > ++          COMMAND hg push
> > ++          COMMENT "After released ${PRJ_VER}"
> > ++          VERBATIM
> > ++          )
> > ++
> > ++      ADD_CUSTOM_TARGET(tag
> > ++          DEPENDS "${MANAGE_SOURCE_VERSION_CONTROL_TAG_FILE}"
> > ++          )
> > ++
> > ++      ADD_CUSTOM_COMMAND(OUTPUT "${MANAGE_SOURCE_VERSION_CONTROL_TAG_=
FILE}"
> > ++          COMMAND make tag_pre
> > ++          COMMAND hg tag -m "${CHANGE_SUMMARY}" "${PRJ_VER}"
> > ++          COMMAND ${CMAKE_COMMAND} -E touch "${MANAGE_SOURCE_VERSION_=
CONTROL_TAG_FILE}"
> > ++          COMMENT "Tagging the source as ver ${PRJ_VER}"
> > ++          VERBATIM
> > ++          )
> > ++
> > ++      MANAGE_SOURCE_VERSION_CONTROL_COMMON()
> > ++    ENDMACRO(MANAGE_SOURCE_VERSION_CONTROL_HG)
> > ++
> > ++    MACRO(MANAGE_SOURCE_VERSION_CONTROL_SVN)
> > ++      SET(MANAGE_SOURCE_VERSION_CONTROL_TAG_FILE
> > ++          ${CMAKE_FEDORA_TEMP_DIR}/${PRJ_VER}
> > ++          CACHE PATH "Source Version Control Tag File" FORCE)
> > ++
> > ++      ADD_CUSTOM_TARGET(after_release_commit
> > ++          COMMAND make after_release_commit_pre
> > ++          COMMAND svn commit -m "${_after_release_message}"
> > ++          COMMENT "After released ${PRJ_VER}"
> > ++          VERBATIM
> > ++          )
> > ++
> > ++      ADD_CUSTOM_TARGET(tag
> > ++          DEPENDS "${MANAGE_SOURCE_VERSION_CONTROL_TAG_FILE}"
> > ++          )
> > ++
> > ++      ADD_CUSTOM_TARGET(OUTPUT "${MANAGE_SOURCE_VERSION_CONTROL_TAG_F=
ILE}"
> > ++          COMMAND make tag_pre
> > ++          COMMAND svn copy "${SOURCE_BASE_URL}/trunk" "${SOURCE_BASE_=
URL}/tags/${PRJ_VER}" -m "${CHANGE_SUMMARY}"
> > ++          COMMAND cmake -E touch ${MANAGE_SOURCE_VERSION_CONTROL_TAG_=
FILE}
> > ++          COMMENT "Tagging the source as ver ${PRJ_VER}"
> > ++          VERBATIM
> > ++          )
> > ++
> > ++      MANAGE_SOURCE_VERSION_CONTROL_COMMON()
> > ++    ENDMACRO(MANAGE_SOURCE_VERSION_CONTROL_SVN)
> > ++
> > ++ENDIF(NOT DEFINED _MANAGE_SOURCE_VERSION_CONTROL_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageString.cmake
> > +@@ -0,0 +1,325 @@
> > ++# - Collection of String utility macros.
> > ++#
> > ++# Included by:
> > ++#   ManageVarible
> > ++#
> > ++# Defines the following macros:
> > ++#   STRING_TRIM(var str [NOUNQUOTE])
> > ++#   - Trim a string by removing the leading and trailing spaces,
> > ++#     just like STRING(STRIP ...) in CMake 2.6 and later.
> > ++#     This macro is needed as CMake 2.4 does not support STRING(STRIP=
 ..)
> > ++#     This macro also remove quote and double quote marks around the =
string,
> > ++#     unless NOUNQUOTE is defined.
> > ++#     * Parameters:
> > ++#       + var: A variable that stores the result.
> > ++#       + str: A string.
> > ++#       + NOUNQUOTE: (Optional) do not remove the double quote mark a=
round the string.
> > ++#
> > ++#   STRING_ESCAPE_SEMICOLON(var str)
> > ++#   - Escape the semicolon
> > ++#     * Parameters:
> > ++#       + var: A variable that stores the result.
> > ++#       + str: A string.
> > ++#
> > ++#   STRING_UNQUOTE(var str)
> > ++#   - Remove double quote marks and quote marks around a string.
> > ++#     If the string is not quoted, then content of str is copied to v=
ar
> > ++#     * Parameters:
> > ++#       + var: A variable that stores the result.
> > ++#       + str: A string.
> > ++#
> > ++#   STRING_JOIN(var delimiter str_list [str...])
> > ++#   - Concatenate strings, with delimiter inserted between strings.
> > ++#     * Parameters:
> > ++#       + var: A variable that stores the result.
> > ++#       + str_list: A list of string.
> > ++#       + str: (Optional) more string to be join.
> > ++#
> > ++#   STRING_SPLIT(var delimiter str [NOESCAPE_SEMICOLON])
> > ++#   - Split a string into a list using a delimiter, which can be in 1=
 or more
> > ++#     characters long.
> > ++#     * Parameters:
> > ++#       + var: A variable that stores the result.
> > ++#       + delimiter: To separate a string.
> > ++#       + str: A string.
> > ++#       + NOESCAPE_SEMICOLON: (Optional) Do not escape semicolons.
> > ++#
> > ++
> > ++IF(NOT DEFINED _MANAGE_STRING_CMAKE_)
> > ++    SET(_MANAGE_STRING_CMAKE_ "DEFINED")
> > ++
> > ++    # Return (index of lefttmost non match character)
> > ++    # Return _strLen if all characters matches regex
> > ++    FUNCTION(STRING_LEFTMOST_NOTMATCH_INDEX var str regex)
> > ++      STRING(LENGTH "${str}" _strLen)
> > ++      SET(_index 0)
> > ++      SET(_ret ${_strLen})
> > ++      WHILE(_index LESS _strLen)
> > ++          STRING(SUBSTRING "${str}" ${_index} 1 _strCursor)
> > ++          #MESSAGE("***STRING_UNQUOTE: _i=3D${_index} _strCursor=3D${=
_strCursor}")
> > ++          IF(NOT "${_strCursor}" MATCHES "${regex}")
> > ++              SET(_ret ${_index})
> > ++              SET(_index ${_strLen})
> > ++          ENDIF(NOT "${_strCursor}" MATCHES "${regex}")
> > ++
> > ++          MATH(EXPR _index ${_index}+1)
> > ++      ENDWHILE(_index LESS _strLen)
> > ++      SET(${var} ${_ret} PARENT_SCOPE)
> > ++    ENDFUNCTION(STRING_LEFTMOST_NOTMATCH_INDEX var str)
> > ++
> > ++    # Return (index of rightmost non match character) +1
> > ++    # Return 0 if all characters matches regex
> > ++    #
> > ++    FUNCTION(STRING_RIGHTMOST_NOTMATCH_INDEX var str regex)
> > ++      STRING(LENGTH "${str}" _strLen)
> > ++      MATH(EXPR _index ${_strLen})
> > ++      SET(_ret 0)
> > ++      WHILE(_index GREATER 0)
> > ++          MATH(EXPR _index_1 ${_index}-1)
> > ++          STRING(SUBSTRING "${str}" ${_index_1} 1 _strCursor)
> > ++          #MESSAGE("***STRING_UNQUOTE: _i=3D${_index} _strCursor=3D${=
_strCursor}")
> > ++
> > ++          IF(NOT "${_strCursor}" MATCHES "${regex}")
> > ++              SET(_ret ${_index})
> > ++              SET(_index 0)
> > ++          ENDIF(NOT "${_strCursor}" MATCHES "${regex}")
> > ++          MATH(EXPR _index ${_index}-1)
> > ++      ENDWHILE(_index GREATER 0)
> > ++      SET(${var} ${_ret} PARENT_SCOPE)
> > ++    ENDFUNCTION(STRING_RIGHTMOST_NOTMATCH_INDEX var str)
> > ++
> > ++    FUNCTION(STRING_TRIM var str)
> > ++      #_STRING_ESCAPE(_ret "${str}" ${ARGN})
> > ++      STRING_LEFTMOST_NOTMATCH_INDEX(_leftIndex "${str}" "[ \t\n\r]")
> > ++      STRING_RIGHTMOST_NOTMATCH_INDEX(_rightIndex "${str}" "[ \t\n\r]=
")
> > ++      #MESSAGE("_left=3D${_leftIndex} _rightIndex=3D${_rightIndex} st=
r=3D|${str}|")
> > ++      MATH(EXPR _subLen ${_rightIndex}-${_leftIndex})
> > ++      SET(_NOUNQUOTE 0)
> > ++      FOREACH( _arg ${ARGN})
> > ++          IF(_arg STREQUAL "NOUNQUOTE")
> > ++              SET(_NOUNQUOTE 1)
> > ++          ENDIF(_arg STREQUAL "NOUNQUOTE")
> > ++      ENDFOREACH( _arg ${ARGN})
> > ++
> > ++      IF(_subLen GREATER 0)
> > ++          STRING(SUBSTRING "${str}" ${_leftIndex} ${_subLen} _ret)
> > ++          # IF _subLen > 1
> > ++          #   IF UNQUOTE; then unquote
> > ++          # Otherwise don't touch
> > ++          IF (_subLen GREATER 1)
> > ++              IF(NOT _NOUNQUOTE)
> > ++                  STRING_UNQUOTE(_ret "${_ret}")
> > ++              ENDIF(NOT _NOUNQUOTE)
> > ++          ENDIF (_subLen GREATER 1)
> > ++      ELSE(_subLen GREATER 0)
> > ++          SET(_ret "")
> > ++      ENDIF(_subLen GREATER 0)
> > ++      SET(${var} "${_ret}" PARENT_SCOPE)
> > ++
> > ++      # Unencoding
> > ++      #_STRING_UNESCAPE(${var} "${_ret}" ${ARGN})
> > ++    ENDFUNCTION(STRING_TRIM var str)
> > ++
> > ++    MACRO(STRING_ESCAPE_SEMICOLON var str)
> > ++      STRING(REGEX REPLACE ";" "\\\\;" ${var} "${str}")
> > ++    ENDMACRO(STRING_ESCAPE_SEMICOLON var str)
> > ++
> > ++    # Internal macro
> > ++    # Nested Variable cannot be escaped here, as variable is already =
substituted
> > ++    # at the time it passes to this macro.
> > ++    MACRO(_STRING_ESCAPE var str)
> > ++      # ';' and '\' are tricky, need to be encoded.
> > ++      # '#' =3D> '#H'
> > ++      # '\' =3D> '#B'
> > ++      # ';' =3D> '#S'
> > ++      SET(_NOESCAPE_SEMICOLON "")
> > ++      SET(_NOESCAPE_HASH "")
> > ++
> > ++      FOREACH(_arg ${ARGN})
> > ++          IF(${_arg} STREQUAL "NOESCAPE_SEMICOLON")
> > ++              SET(_NOESCAPE_SEMICOLON "NOESCAPE_SEMICOLON")
> > ++          ELSEIF(${_arg} STREQUAL "NOESCAPE_HASH")
> > ++              SET(_NOESCAPE_HASH "NOESCAPE_HASH")
> > ++          ENDIF(${_arg} STREQUAL "NOESCAPE_SEMICOLON")
> > ++      ENDFOREACH(_arg ${ARGN})
> > ++
> > ++      IF(_NOESCAPE_HASH STREQUAL "")
> > ++          STRING(REGEX REPLACE "#" "#H" _ret "${str}")
> > ++      ELSE(_NOESCAPE_HASH STREQUAL "")
> > ++          SET(_ret "${str}")
> > ++      ENDIF(_NOESCAPE_HASH STREQUAL "")
> > ++
> > ++      STRING(REGEX REPLACE "\\\\" "#B" _ret "${_ret}")
> > ++      IF(_NOESCAPE_SEMICOLON STREQUAL "")
> > ++          STRING(REGEX REPLACE ";" "#S" _ret "${_ret}")
> > ++      ENDIF(_NOESCAPE_SEMICOLON STREQUAL "")
> > ++      #MESSAGE("_STRING_ESCAPE:_ret=3D${_ret}")
> > ++      SET(${var} "${_ret}")
> > ++    ENDMACRO(_STRING_ESCAPE var str)
> > ++
> > ++    MACRO(_STRING_UNESCAPE var str)
> > ++      # '#B' =3D> '\'
> > ++      # '#H' =3D> '#'
> > ++      # '#D' =3D> '$'
> > ++      # '#S' =3D> ';'
> > ++      SET(_ESCAPE_VARIABLE "")
> > ++      SET(_NOESCAPE_SEMICOLON "")
> > ++      SET(_ret "${str}")
> > ++      FOREACH(_arg ${ARGN})
> > ++          IF(${_arg} STREQUAL "NOESCAPE_SEMICOLON")
> > ++              SET(_NOESCAPE_SEMICOLON "NOESCAPE_SEMICOLON")
> > ++          ELSEIF(${_arg} STREQUAL "ESCAPE_VARIABLE")
> > ++              SET(_ESCAPE_VARIABLE "ESCAPE_VARIABLE")
> > ++              STRING(REGEX REPLACE "#D" "$" _ret "${_ret}")
> > ++          ENDIF(${_arg} STREQUAL "NOESCAPE_SEMICOLON")
> > ++      ENDFOREACH(_arg ${ARGN})
> > ++      #MESSAGE("###_STRING_UNESCAPE: var=3D${var} _ret=3D${_ret} _NOE=
SCAPE_SEMICOLON=3D${_NOESCAPE_SEMICOLON} ESCAPE_VARIABLE=3D${_ESCAPE_VARIAB=
LE}")
> > ++
> > ++      STRING(REGEX REPLACE "#B" "\\\\" _ret "${_ret}")
> > ++      IF("${_NOESCAPE_SEMICOLON}" STREQUAL "")
> > ++          # ESCAPE_SEMICOLON
> > ++          STRING(REGEX REPLACE "#S" "\\\\;" _ret "${_ret}")
> > ++      ELSE("${_NOESCAPE_SEMICOLON}" STREQUAL "")
> > ++          # Don't ESCAPE_SEMICOLON
> > ++          STRING(REGEX REPLACE "#S" ";" _ret "${_ret}")
> > ++      ENDIF("${_NOESCAPE_SEMICOLON}" STREQUAL "")
> > ++
> > ++      IF(NOT _ESCAPE_VARIABLE STREQUAL "")
> > ++          # '#D' =3D> '$'
> > ++          STRING(REGEX REPLACE "#D" "$" _ret "${_ret}")
> > ++      ENDIF(NOT _ESCAPE_VARIABLE STREQUAL "")
> > ++      STRING(REGEX REPLACE "#H" "#" _ret "${_ret}")
> > ++      SET(${var} "${_ret}")
> > ++      #MESSAGE("*** _STRING_UNESCAPE: ${var}=3D${${var}}")
> > ++    ENDMACRO(_STRING_UNESCAPE var str)
> > ++
> > ++    MACRO(STRING_UNQUOTE var str)
> > ++      SET(_ret "${str}")
> > ++      STRING(LENGTH "${str}" _strLen)
> > ++
> > ++      # IF _strLen > 1
> > ++      #   IF lCh and rCh are both "\""
> > ++      #      Remove _lCh and _rCh
> > ++      #   ELSEIF lCh and rCh are both "'"
> > ++      #      Remove _lCh and _rCh
> > ++      # Otherwise don't touch
> > ++      IF(_strLen GREATER 1)
> > ++          STRING(SUBSTRING "${str}" 0 1 _lCh)
> > ++          MATH(EXPR _strLen_1 ${_strLen}-1)
> > ++          MATH(EXPR _strLen_2 ${_strLen_1}-1)
> > ++          STRING(SUBSTRING "${str}" ${_strLen_1} 1 _rCh)
> > ++          #MESSAGE("_lCh=3D${_lCh} _rCh=3D${_rCh} _ret=3D|${_ret}|")
> > ++          IF("${_lCh}" STREQUAL "\"" AND "${_rCh}" STREQUAL "\"")
> > ++              STRING(SUBSTRING "${_ret}" 1 ${_strLen_2} _ret)
> > ++          ELSEIF("${_lCh}" STREQUAL "'" AND "${_rCh}" STREQUAL "'")
> > ++              STRING(SUBSTRING "${_ret}" 1 ${_strLen_2} _ret)
> > ++          ENDIF("${_lCh}" STREQUAL "\"" AND "${_rCh}" STREQUAL "\"")
> > ++      ENDIF (_strLen GREATER 1)
> > ++      SET(${var} "${_ret}")
> > ++    ENDMACRO(STRING_UNQUOTE var str)
> > ++
> > ++    MACRO(STRING_JOIN var delimiter str_list)
> > ++      SET(_ret "")
> > ++      FOREACH(_str ${str_list})
> > ++          IF(_ret STREQUAL "")
> > ++              SET(_ret "${_str}")
> > ++          ELSE(_ret STREQUAL "")
> > ++              SET(_ret "${_ret}${delimiter}${_str}")
> > ++          ENDIF(_ret STREQUAL "")
> > ++      ENDFOREACH(_str ${str_list})
> > ++
> > ++      FOREACH(_str ${ARGN})
> > ++          IF(_ret STREQUAL "")
> > ++              SET(_ret "${_str}")
> > ++          ELSE(_ret STREQUAL "")
> > ++              SET(_ret "${_ret}${delimiter}${_str}")
> > ++          ENDIF(_ret STREQUAL "")
> > ++      ENDFOREACH(_str ${ARGN})
> > ++      SET(${var} "${_ret}")
> > ++    ENDMACRO(STRING_JOIN var delimiter str_list)
> > ++
> > ++    FUNCTION(STRING_FIND var str search_str)
> > ++      STRING(LENGTH "${str}" _str_len)
> > ++      STRING(LENGTH "${search_str}" _search_len)
> > ++      MATH(EXPR _str_end ${_str_len}-${_search_len}+1)
> > ++
> > ++      SET(_index 0)
> > ++      SET(_str_remain "")
> > ++      SET(_result -1)
> > ++      WHILE(_index LESS _str_end)
> > ++          STRING(SUBSTRING "${str}" ${_index} ${_search_len} _str_win=
dow)
> > ++          IF("${_str_window}" STREQUAL "${search_str}")
> > ++              SET(_result ${_index})
> > ++              BREAK()
> > ++          ELSE("${_str_window}" STREQUAL "${search_str}")
> > ++              MATH(EXPR _index ${_index}+1)
> > ++          ENDIF("${_str_window}" STREQUAL "${search_str}")
> > ++      ENDWHILE(_index LESS _str_end)
> > ++      SET(${var} ${_result} PARENT_SCOPE)
> > ++    ENDFUNCTION(STRING_FIND var str search)
> > ++
> > ++    FUNCTION(STRING_SPLIT_2 var str_remain delimiter str)
> > ++      STRING_FIND(_index "${str}" "${delimiter}")
> > ++      IF(_index EQUAL -1)
> > ++          SET(${var} "${str}" PARENT_SCOPE)
> > ++          SET(${str_remain} "" PARENT_SCOPE)
> > ++      ELSE(_index EQUAL -1)
> > ++          STRING(SUBSTRING "${str}" 0 ${_index} _var)
> > ++          SET(${var} "${_var}" PARENT_SCOPE)
> > ++
> > ++          STRING(LENGTH "${str}" _str_len)
> > ++          STRING(LENGTH "${delimiter}" _delimiter_len)
> > ++          MATH(EXPR _str_2_start ${_index}+${_delimiter_len})
> > ++          MATH(EXPR _str_2_len ${_str_len}-${_index}-${_delimiter_len=
})
> > ++          STRING(SUBSTRING "${str}" ${_str_2_start} ${_str_2_len} _st=
r_remain)
> > ++          SET(${str_remain} "${_str_remain}" PARENT_SCOPE)
> > ++      ENDIF(_index EQUAL -1)
> > ++    ENDFUNCTION(STRING_SPLIT_2 var str_remain delimiter str)
> > ++
> > ++    MACRO(STRING_SPLIT var delimiter str)
> > ++      #MESSAGE("***STRING_SPLIT: var=3D${var} str=3D${str}")
> > ++      SET(_max_tokens "")
> > ++      SET(_NOESCAPE_SEMICOLON "")
> > ++      SET(_ESCAPE_VARIABLE "")
> > ++      FOREACH(_arg ${ARGN})
> > ++          IF(${_arg} STREQUAL "NOESCAPE_SEMICOLON")
> > ++              SET(_NOESCAPE_SEMICOLON "NOESCAPE_SEMICOLON")
> > ++          ELSEIF(${_arg} STREQUAL "ESCAPE_VARIABLE")
> > ++              SET(_ESCAPE_VARIABLE "ESCAPE_VARIABLE")
> > ++          ELSE(${_arg} STREQUAL "NOESCAPE_SEMICOLON")
> > ++              SET(_max_tokens ${_arg})
> > ++          ENDIF(${_arg} STREQUAL "NOESCAPE_SEMICOLON")
> > ++      ENDFOREACH(_arg ${ARGN})
> > ++
> > ++      IF(NOT _max_tokens)
> > ++          SET(_max_tokens -1)
> > ++      ENDIF(NOT _max_tokens)
> > ++
> > ++      _STRING_ESCAPE(_str "${str}" ${_NOESCAPE_SEMICOLON} ${_ESCAPE_V=
ARIABLE})
> > ++      _STRING_ESCAPE(_delimiter "${delimiter}" ${_NOESCAPE_SEMICOLON}=
 ${_ESCAPE_VARIABLE})
> > ++      SET(_str_list "")
> > ++      SET(_token_count 1)
> > ++
> > ++      WHILE(NOT _token_count EQUAL _max_tokens)
> > ++          STRING_SPLIT_2(_token _str "${_delimiter}" "${_str}")
> > ++          #MESSAGE("_token_count=3D${_token_count} _max_tokens=3D${_m=
ax_tokens} _token=3D${_token} _str=3D${_str}")
> > ++          MATH(EXPR _token_count ${_token_count}+1)
> > ++          LIST(APPEND _str_list "${_token}")
> > ++          IF("${_str}" STREQUAL "")
> > ++              ## No more tokens
> > ++              BREAK()
> > ++          ENDIF("${_str}" STREQUAL "")
> > ++      ENDWHILE(NOT _token_count EQUAL _max_tokens)
> > ++
> > ++      IF(NOT "x${_str}" STREQUAL "x")
> > ++          ## Append last part
> > ++          LIST(APPEND _str_list "${_str}")
> > ++      ENDIF(NOT "x${_str}" STREQUAL "x")
> > ++
> > ++      # Unencoding
> > ++      _STRING_UNESCAPE(${var} "${_str_list}" ${_NOESCAPE_SEMICOLON} $=
{_ESCAPE_VARIABLE})
> > ++      #MESSAGE("***STRING_SPLIT: tokens=3D${${var}}")
> > ++    ENDMACRO(STRING_SPLIT var delimiter str)
> > ++
> > ++ENDIF(NOT DEFINED _MANAGE_STRING_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageTarget.cmake
> > +@@ -0,0 +1,40 @@
> > ++# - Modules for managing targets and outputs.
> > ++#
> > ++# Defines following macros:
> > ++#   ADD_CUSTOM_TARGET_COMMAND(target OUTPUT file1 [file2 ..] COMMAND
> > ++#   command1 ...)
> > ++#   - Combine ADD_CUSTOM_TARGET and ADD_CUSTOM_COMMAND.
> > ++#     Always build when making the target, also specify the output fi=
les
> > ++#     Arguments:
> > ++#     + target: target for this command
> > ++#     + file1, file2 ... : Files to be outputted by this command
> > ++#     + command1 ... : Command to be run. The rest arguments are same=
 with
> > ++#                      ADD_CUSTOM_TARGET.
> > ++#
> > ++
> > ++IF(NOT DEFINED _MANAGE_TARGET_CMAKE_)
> > ++    SET(_MANAGE_TARGET_CMAKE_ "DEFINED")
> > ++    MACRO(ADD_CUSTOM_TARGET_COMMAND target OUTPUT)
> > ++      SET(_outputFileList "")
> > ++      SET(_optionList "")
> > ++      SET(_outputFileMode 1)
> > ++      FOREACH(_t ${ARGN})
> > ++          IF(_outputFileMode)
> > ++              IF(_t STREQUAL "COMMAND")
> > ++                  SET(_outputFileMode 0)
> > ++                  LIST(APPEND _optionList "${_t}")
> > ++              ELSE(_t STREQUAL "COMMAND")
> > ++                  LIST(APPEND _outputFileList "${_t}")
> > ++              ENDIF(_t STREQUAL "COMMAND")
> > ++          ELSE(_outputFileMode)
> > ++              LIST(APPEND _optionList "${_t}")
> > ++          ENDIF(_outputFileMode)
> > ++      ENDFOREACH(_t ${ARGN})
> > ++      #MESSAGE("ADD_CUSTOM_TARGET(${target} ${_optionList})")
> > ++      ADD_CUSTOM_TARGET(${target} ${_optionList})
> > ++      #MESSAGE("ADD_CUSTOM_COMMAND(OUTPUT ${_outputFileList}  ${_opti=
onList})")
> > ++      ADD_CUSTOM_COMMAND(OUTPUT ${_outputFileList}  ${_optionList})
> > ++    ENDMACRO(ADD_CUSTOM_TARGET_COMMAND)
> > ++
> > ++ENDIF(NOT DEFINED _MANAGE_TARGET_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageTranslation.cmake
> > +@@ -0,0 +1,305 @@
> > ++# - Software Translation support
> > ++# This module supports software translation by:
> > ++#   1) Creates gettext related targets.
> > ++#   2) Communicate to Zanata servers.
> > ++#
> > ++# Defines following targets:
> > ++#   + translations: Make the translation files.
> > ++#     This target itself does nothing but provide a target for others=
 to
> > ++#     depend on.
> > ++#     If macro MANAGE_GETTEXT is used, then it depends on the target =
gmo_files.
> > ++#
> > ++# Defines following variables:
> > ++#   + XGETTEXT_OPTIONS_C: Usual xgettext options for C programs.
> > ++#
> > ++# Defines following macros:
> > ++#   MANAGE_GETTEXT [ALL] SRCS src1 [src2 [...]]
> > ++#     [LOCALES locale1 [locale2 [...]]]
> > ++#     [POTFILE potfile]
> > ++#     [XGETTEXT_OPTIONS xgettextOpt]]
> > ++#     )
> > ++#   - Provide Gettext support like pot file generation and
> > ++#     gmo file generation.
> > ++#     You can specify supported locales with LOCALES ...
> > ++#     or omit the locales to use all the po files.
> > ++#
> > ++#     Arguments:
> > ++#     + ALL: (Optional) make target "all" depends on gettext targets.
> > ++#     + SRCS src1 [src2 [...]]: File list of source code that contain=
s msgid.
> > ++#     + LOCALES locale1 [local2 [...]]:(optional) Locale list to be g=
enerated.
> > ++#       Currently, only the format: lang_Region (such as fr_FR) is su=
pported.
> > ++#     + POTFILE potFile: (optional) pot file to be referred.
> > ++#       Default: ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.pot
> > ++#     + XGETTEXT_OPTIONS xgettextOpt: (optional) xgettext_options.
> > ++#       Default: ${XGETTEXT_OPTIONS_C}
> > ++#     Defines following variables:
> > ++#     + GETTEXT_MSGMERGE_CMD: the full path to the msgmerge tool.
> > ++#     + GETTEXT_MSGFMT_CMD: the full path to the msgfmt tool.
> > ++#     + XGETTEXT_CMD: the full path to the xgettext.
> > ++#     Targets:
> > ++#     + pot_file: Generate the pot_file.
> > ++#     + gmo_files: Converts input po files into the binary output mo =
files.
> > ++#
> > ++#   MANAGE_ZANATA(serverUrl [YES])
> > ++#   - Use Zanata (was flies) as translation service.
> > ++#     Arguments:
> > ++#     + serverUrl: The URL of Zanata server
> > ++#     + YES: Assume yes for all questions.
> > ++#     Reads following variables:
> > ++#     + ZANATA_XML_FILE: Path to zanata.xml
> > ++#       Default:${CMAKE_CURRENT_SOURCE_DIR}/zanata.xml
> > ++#     + ZANATA_INI_FILE: Path to zanata.ini
> > ++#       Default:${CMAKE_CURRENT_SOURCE_DIR}/zanata.xml
> > ++#     + ZANATA_PUSH_OPTIONS: Options for zanata push
> > ++#     + ZANATA_PULL_OPTIONS: Options for zanata pull
> > ++#     Targets:
> > ++#     + zanata_project_create: Create project with PROJECT_NAME in za=
nata
> > ++#       server.
> > ++#     + zanata_version_create: Create version PRJ_VER in zanata serve=
r.
> > ++#     + zanata_push: Push source messages to zanata server
> > ++#     + zanata_push_trans: Push source messages and translations to z=
anata server.
> > ++#     + zanata_pull: Pull translations from zanata server.
> > ++#
> > ++
> > ++
> > ++IF(NOT DEFINED _MANAGE_TRANSLATION_CMAKE_)
> > ++    SET(_MANAGE_TRANSLATION_CMAKE_ "DEFINED")
> > ++    SET(XGETTEXT_OPTIONS_C
> > ++      --language=3DC --keyword=3D_ --keyword=3DN_ --keyword=3DC_:1c,2=
 --keyword=3DNC_:1c,2 -s
> > ++      --package-name=3D${PROJECT_NAME} --package-version=3D${PRJ_VER}=
)
> > ++    SET(MANAGE_TRANSLATION_GETTEXT_MSGMERGE_OPTIONS "--indent" "--upd=
ate" "--backup=3Dnone" CACHE STRING "msgmerge options")
> > ++    SET_DIRECTORY_PROPERTIES(PROPERTIES CLEAN_NO_CUSTOM "1")
> > ++
> > ++    INCLUDE(ManageMessage)
> > ++    IF(NOT TARGET translations)
> > ++      ADD_CUSTOM_TARGET(translations
> > ++          COMMENT "Making translations"
> > ++          )
> > ++    ENDIF(NOT TARGET translations)
> > ++
> > ++    #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ++    # GETTEXT support
> > ++
> > ++    MACRO(MANAGE_GETTEXT_INIT)
> > ++      FIND_PROGRAM(XGETTEXT_CMD xgettext)
> > ++      IF(XGETTEXT_CMD STREQUAL "XGETTEXT_CMD-NOTFOUND")
> > ++          SET(_gettext_dependency_missing 1)
> > ++          M_MSG(${M_OFF} "xgettext not found! gettext support disable=
d.")
> > ++      ENDIF(XGETTEXT_CMD STREQUAL "XGETTEXT_CMD-NOTFOUND")
> > ++
> > ++      FIND_PROGRAM(GETTEXT_MSGMERGE_CMD msgmerge)
> > ++      IF(GETTEXT_MSGMERGE_CMD STREQUAL "GETTEXT_MSGMERGE_CMD-NOTFOUND=
")
> > ++          SET(_gettext_dependency_missing 1)
> > ++          M_MSG(${M_OFF} "msgmerge not found! gettext support disable=
d.")
> > ++      ENDIF(GETTEXT_MSGMERGE_CMD STREQUAL "GETTEXT_MSGMERGE_CMD-NOTFO=
UND")
> > ++
> > ++      FIND_PROGRAM(GETTEXT_MSGFMT_CMD msgfmt)
> > ++      IF(GETTEXT_MSGFMT_CMD STREQUAL "GETTEXT_MSGFMT_CMD-NOTFOUND")
> > ++          SET(_gettext_dependency_missing 1)
> > ++          M_MSG(${M_OFF} "msgfmt not found! gettext support disabled.=
")
> > ++      ENDIF(GETTEXT_MSGFMT_CMD STREQUAL "GETTEXT_MSGFMT_CMD-NOTFOUND"=
)
> > ++
> > ++    ENDMACRO(MANAGE_GETTEXT_INIT)
> > ++
> > ++    FUNCTION(MANAGE_GETTEXT)
> > ++      SET(_gettext_dependency_missing 0)
> > ++      MANAGE_GETTEXT_INIT()
> > ++      IF(NOT _gettext_dependency_missing)
> > ++          SET(_stage "")
> > ++          SET(_all "")
> > ++          SET(_srcList "")
> > ++          SET(_srcList_abs "")
> > ++          SET(_localeList "")
> > ++          SET(_potFile "")
> > ++          SET(_xgettext_option_list "")
> > ++          FOREACH(_arg ${ARGN})
> > ++              IF(_arg STREQUAL "ALL")
> > ++                  SET(_all "ALL")
> > ++              ELSEIF(_arg STREQUAL "SRCS")
> > ++                  SET(_stage "SRCS")
> > ++              ELSEIF(_arg STREQUAL "LOCALES")
> > ++                  SET(_stage "LOCALES")
> > ++              ELSEIF(_arg STREQUAL "XGETTEXT_OPTIONS")
> > ++                  SET(_stage "XGETTEXT_OPTIONS")
> > ++              ELSEIF(_arg STREQUAL "POTFILE")
> > ++                  SET(_stage "POTFILE")
> > ++              ELSE(_arg STREQUAL "ALL")
> > ++                  IF(_stage STREQUAL "SRCS")
> > ++                      FILE(RELATIVE_PATH _relFile ${CMAKE_CURRENT_BIN=
ARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/${_arg})
> > ++                      LIST(APPEND _srcList ${_relFile})
> > ++                      GET_FILENAME_COMPONENT(_absPoFile ${_arg} ABSOL=
UTE)
> > ++                      LIST(APPEND _srcList_abs ${_absPoFile})
> > ++                  ELSEIF(_stage STREQUAL "LOCALES")
> > ++                      LIST(APPEND _localeList ${_arg})
> > ++                  ELSEIF(_stage STREQUAL "XGETTEXT_OPTIONS")
> > ++                      LIST(APPEND _xgettext_option_list ${_arg})
> > ++                  ELSEIF(_stage STREQUAL "POTFILE")
> > ++                      SET(_potFile "${_arg}")
> > ++                  ELSE(_stage STREQUAL "SRCS")
> > ++                      M_MSG(${M_WARN} "MANAGE_GETTEXT: not recognizin=
g arg ${_arg}")
> > ++                  ENDIF(_stage STREQUAL "SRCS")
> > ++              ENDIF(_arg STREQUAL "ALL")
> > ++          ENDFOREACH(_arg ${ARGN})
> > ++
> > ++          # Default values
> > ++          IF(_xgettext_option_list STREQUAL "")
> > ++              SET(_xgettext_option_list ${XGETTEXT_OPTIONS_C})
> > ++          ENDIF(_xgettext_option_list STREQUAL "")
> > ++
> > ++          IF(_potFile STREQUAL "")
> > ++              SET(_potFile "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAM=
E}.pot")
> > ++          ENDIF(_potFile STREQUAL "")
> > ++
> > ++          IF(NOT _localeList)
> > ++              FILE(GLOB _poFiles "*.po")
> > ++              FOREACH(_poFile ${_poFiles})
> > ++                  GET_FILENAME_COMPONENT(_locale "${_poFile}" NAME_WE=
)
> > ++                  LIST(APPEND _localeList "${_locale}")
> > ++              ENDFOREACH(_poFile ${_poFiles})
> > ++          ENDIF(NOT _localeList)
> > ++
> > ++          M_MSG(${M_INFO2} "XGETTEXT=3D${XGETTEXT_CMD} ${_xgettext_op=
tion_list} -o ${_potFile} ${_srcList}")
> > ++          ADD_CUSTOM_COMMAND(OUTPUT ${_potFile}
> > ++              COMMAND ${XGETTEXT_CMD} ${_xgettext_option_list} -o ${_=
potFile} ${_srcList}
> > ++              DEPENDS ${_srcList_abs}
> > ++              WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
> > ++              COMMENT "Extract translatable messages to ${_potFile}"
> > ++              )
> > ++
> > ++          ADD_CUSTOM_TARGET(pot_file ${_all}
> > ++              DEPENDS ${_potFile}
> > ++              )
> > ++
> > ++          ### Generating gmo files
> > ++          SET(_gmoFileList "")
> > ++          SET(_absGmoFileList "")
> > ++          SET(_absPoFileList "")
> > ++          GET_FILENAME_COMPONENT(_potBasename ${_potFile} NAME_WE)
> > ++          GET_FILENAME_COMPONENT(_potDir ${_potFile} PATH)
> > ++          GET_FILENAME_COMPONENT(_absPotFile ${_potFile} ABSOLUTE)
> > ++          GET_FILENAME_COMPONENT(_absPotDir ${_absPotFile} PATH)
> > ++          FOREACH(_locale ${_localeList})
> > ++              SET(_absGmoFile ${_absPotDir}/${_locale}.gmo)
> > ++              SET(_absPoFile ${_absPotDir}/${_locale}.po)
> > ++
> > ++              ADD_CUSTOM_COMMAND(OUTPUT ${_absPoFile}
> > ++                  COMMAND ${GETTEXT_MSGMERGE_CMD}
> > ++                  ${MANAGE_TRANSLATION_GETTEXT_MSGMERGE_OPTIONS} ${_a=
bsPoFile} ${_potFile}
> > ++                  DEPENDS ${_potFile}
> > ++                  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
> > ++                  COMMENT "${GETTEXT_MSGMERGE_CMD} ${MANAGE_TRANSLATI=
ON_GETTEXT_MSGMERGE_OPTIONS} ${_absPoFile} ${_potFile}"
> > ++                  )
> > ++
> > ++              ADD_CUSTOM_COMMAND(OUTPUT ${_absGmoFile}
> > ++                  COMMAND ${GETTEXT_MSGFMT_CMD} -o ${_absGmoFile} ${_=
absPoFile}
> > ++                  DEPENDS ${_absPoFile}
> > ++                  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
> > ++                  COMMENT "${GETTEXT_MSGFMT_CMD} -o ${_absGmoFile} ${=
_absPoFile}"
> > ++                  )
> > ++
> > ++              #MESSAGE("_absPoFile=3D${_absPoFile} _absPotDir=3D${_ab=
sPotDir} _lang=3D${_lang} curr_bin=3D${CMAKE_CURRENT_BINARY_DIR}")
> > ++              INSTALL(FILES ${_absGmoFile} DESTINATION share/locale/$=
{_locale}/LC_MESSAGES RENAME ${_potBasename}.mo)
> > ++              LIST(APPEND _absGmoFileList ${_absGmoFile})
> > ++              LIST(APPEND _absPoFileList ${_absPoFile})
> > ++          ENDFOREACH(_locale ${_localeList})
> > ++          SET_DIRECTORY_PROPERTIES(PROPERTIES ADDITIONAL_MAKE_CLEAN_F=
ILES "${_absGmoFileList};${_potFile}" )
> > ++
> > ++          SET(MANAGE_TRANSLATION_GETTEXT_PO_FILES ${_absPoFileList} C=
ACHE STRING "PO files")
> > ++
> > ++          ADD_CUSTOM_TARGET(gmo_files ${_all}
> > ++              DEPENDS ${_absGmoFileList}
> > ++              COMMENT "Generate gmo files for translation"
> > ++              )
> > ++
> > ++          ADD_DEPENDENCIES(translations gmo_files)
> > ++      ENDIF(NOT _gettext_dependency_missing)
> > ++    ENDFUNCTION(MANAGE_GETTEXT)
> > ++
> > ++
> > ++    #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ++    # ZANATA support
> > ++    MACRO(MANAGE_ZANATA serverUrl)
> > ++      SET(ZANATA_SERVER "${serverUrl}")
> > ++      FIND_PROGRAM(ZANATA_CMD zanata)
> > ++      SET(_manage_zanata_dependencies_missing 0)
> > ++      IF(ZANATA_CMD STREQUAL "ZANATA_CMD-NOTFOUND")
> > ++          SET(_manage_zanata_dependencies_missing 1)
> > ++          M_MSG(${M_OFF} "zanata (python client) not found! zanata su=
pport disabled.")
> > ++      ENDIF(ZANATA_CMD STREQUAL "ZANATA_CMD-NOTFOUND")
> > ++
> > ++      SET(ZANATA_XML_FILE "${CMAKE_CURRENT_SOURCE_DIR}/zanata.xml" CA=
CHE FILEPATH "zanata.xml")
> > ++      IF(NOT EXISTS "${ZANATA_XML_FILE}")
> > ++          SET(_manage_zanata_dependencies_missing 1)
> > ++          M_MSG(${M_OFF} "zanata.xml is not found! Zanata support dis=
abled.")
> > ++      ENDIF(NOT EXISTS "${ZANATA_XML_FILE}")
> > ++
> > ++      SET(ZANATA_INI_FILE "$ENV{HOME}/.config/zanata.ini" CACHE FILEP=
ATH "zanata.ni")
> > ++      IF(NOT EXISTS "${ZANATA_INI_FILE}")
> > ++          SET(_manage_zanata_dependencies_missing 1)
> > ++          M_MSG(${M_OFF} "zanata.ini is not found! Zanata support dis=
abled.")
> > ++      ENDIF(NOT EXISTS "${ZANATA_INI_FILE}")
> > ++
> > ++      IF(NOT _manage_zanata_dependencies_missing)
> > ++          SET(_zanata_args --url "${ZANATA_SERVER}"
> > ++              --project-config "${ZANATA_XML_FILE}" --user-config "${=
ZANATA_INI_FILE}")
> > ++
> > ++          # Parsing arguments
> > ++          SET(_yes "")
> > ++          FOREACH(_arg ${ARGN})
> > ++              IF(_arg STREQUAL "YES")
> > ++                  SET(_yes "yes" "|")
> > ++              ENDIF(_arg STREQUAL "YES")
> > ++          ENDFOREACH(_arg ${ARGN})
> > ++
> > ++          ADD_CUSTOM_TARGET(zanata_project_create
> > ++              COMMAND ${ZANATA_CMD} project create ${PROJECT_NAME} ${=
_zanata_args}
> > ++              --project-name "${PROJECT_NAME}" --project-desc "${PRJ_=
SUMMARY}"
> > ++              COMMENT "Creating project ${PROJECT_NAME} on Zanata ser=
ver ${serverUrl}"
> > ++              VERBATIM
> > ++              )
> > ++
> > ++          ADD_CUSTOM_TARGET(zanata_version_create
> > ++              COMMAND ${ZANATA_CMD} version create
> > ++              ${PRJ_VER} ${_zanata_args} --project-id "${PROJECT_NAME=
}"
> > ++              COMMENT "Creating version ${PRJ_VER} on Zanata server $=
{serverUrl}"
> > ++              VERBATIM
> > ++              )
> > ++
> > ++          SET(_po_files_depend "")
> > ++          IF(MANAGE_TRANSLATION_GETTEXT_PO_FILES)
> > ++              SET(_po_files_depend "DEPENDS" ${MANAGE_TRANSLATION_GET=
TEXT_PO_FILES})
> > ++          ENDIF(MANAGE_TRANSLATION_GETTEXT_PO_FILES)
> > ++          # Zanata push
> > ++          ADD_CUSTOM_TARGET(zanata_push
> > ++              COMMAND ${_yes}
> > ++              ${ZANATA_CMD} push ${_zanata_args} ${ZANATA_PUSH_OPTION=
S}
> > ++              ${_po_files_depend}
> > ++              COMMENT "Push source messages to zanata server ${ZANATA=
_SERVER}"
> > ++              VERBATIM
> > ++              )
> > ++          ADD_DEPENDENCIES(zanata_push pot_file)
> > ++
> > ++          # Zanata push with translation
> > ++          ADD_CUSTOM_TARGET(zanata_push_trans
> > ++              COMMAND ${_yes}
> > ++              ${ZANATA_CMD} push ${_zanata_args} --push-type both ${Z=
ANATA_PUSH_OPTIONS}
> > ++              ${_po_files_depend}
> > ++              COMMENT "Push source messages and translations to zanat=
a server ${ZANATA_SERVER}"
> > ++              VERBATIM
> > ++              )
> > ++
> > ++          ADD_DEPENDENCIES(zanata_push_trans pot_file)
> > ++
> > ++          # Zanata pull
> > ++          ADD_CUSTOM_TARGET(zanata_pull
> > ++              COMMAND ${_yes}
> > ++              ${ZANATA_CMD} pull ${_zanata_args} ${ZANATA_PULL_OPTION=
S}
> > ++              COMMENT "Pull translations fro zanata server ${ZANATA_S=
ERVER}"
> > ++              VERBATIM
> > ++              )
> > ++
> > ++      ENDIF(NOT _manage_zanata_dependencies_missing)
> > ++    ENDMACRO(MANAGE_ZANATA serverUrl)
> > ++
> > ++ENDIF(NOT DEFINED _MANAGE_TRANSLATION_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageUninstall.cmake
> > +@@ -0,0 +1,28 @@
> > ++# - Uninstall target.
> > ++# Use this module to provide uninstall target.
> > ++#
> > ++# Define following targets
> > ++#   uninstall: For uninstalling the package.
> > ++#
> > ++
> > ++IF(NOT DEFINED _MANAGE_UNINSTALL_CMAKE_)
> > ++    SET(_MANAGE_UNINSTALL_CMAKE_ "DEFINED")
> > ++    SET(CMAKE_UNINSTALL_IN_SEARCH_PATH ${CMAKE_MODULE_PATH} ${CMAKE_R=
OOT}/Modules ${CMAKE_SOURCE_DIR} ${CMAKE_SOURCE_DIR}/Modules)
> > ++    FIND_FILE(CMAKE_UNINSTALL_IN cmake_uninstall.cmake.in
> > ++      PATHS ${CMAKE_UNINSTALL_IN_SEARCH_PATH})
> > ++
> > ++    # MESSAGE("CMAKE_UNINSTALL_IN=3D${CMAKE_UNINSTALL_IN}")
> > ++    IF(CMAKE_UNINSTALL_IN STREQUAL "CMAKE_UNINSTALL_IN-NOTFOUND")
> > ++      MESSAGE(FATAL_ERROR "Cannot find cmake_uninstall.cmake.in in"
> > ++          "${CMAKE_UNINSTALL_IN_SEARCH_PATH}")
> > ++    ENDIF(CMAKE_UNINSTALL_IN STREQUAL "CMAKE_UNINSTALL_IN-NOTFOUND")
> > ++
> > ++    CONFIGURE_FILE("${CMAKE_UNINSTALL_IN}"
> > ++      "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninstall.cmake"
> > ++      IMMEDIATE @ONLY)
> > ++
> > ++    ADD_CUSTOM_TARGET(uninstall
> > ++      "${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake_uninst=
all.cmake"
> > ++      )
> > ++ENDIF(NOT DEFINED _MANAGE_UNINSTALL_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageUpload.cmake
> > +@@ -0,0 +1,184 @@
> > ++# - Upload files to hosting services.
> > ++# You can either use sftp, scp or supply custom command for upload.
> > ++# The custom command should be in following format:
> > ++#    cmd [OPTIONS] [url]
> > ++#
> > ++# This module defines following macros:
> > ++#   MACRO(MANAGE_UPLOAD_MAKE_TARGET varPrefix fileAlias [uploadOption=
s])
> > ++#   - Make a target for upload files.
> > ++#     If <varPrefix>_HOST_ALIAS is not empty, the target is
> > ++#     upload_${${varPrefix}_HOST_ALIAS}_${fileAlias}, otherwise, the =
target is
> > ++#     upload_${${varPrefix}_HOST_ALIAS}_${fileAlias}
> > ++#     Arguments:
> > ++#     + varPrefix: Variable prefix
> > ++#     + fileAlias: File alias which will be used as part of target na=
me
> > ++#     + uploadOptions: Options for the upload command
> > ++#     Reads following variables:
> > ++#     + <varPrefix>_CMD: Upload command
> > ++#     + <varPrefix>_DEPENDS: Extra files that the upload load target =
depends on.
> > ++#     + <varPrefix>_HOST_ALIAS: (Optional) Host alias which will be u=
sed as part of target name.
> > ++#     + <varPrefix>_HOST_URL: Host URL
> > ++#     + <varPrefix>_REMOTE_DIR: (Optional) Remote dir/
> > ++#     + <varPrefix>_UPLOAD_FILES: Files to be uploaded. The target de=
pends on these files.
> > ++#     + <varPrefix>_UPLOAD_OPTIONS: Options for upload command.
> > ++#     + <varPrefix>_USER: (Optional) User for uploading
> > ++#
> > ++# This module defines following macros:
> > ++#   MANAGE_UPLOAD_CMD(cmd fileAlias [USER user] [HOST_URL hostUrl]
> > ++#     [HOST_ALIAS hostAlias] [UPLOAD_FILES files] [REMOTE_DIR remoteD=
ir]
> > ++#     [UPLOAD_OPTIONS options] [DEPENDS files])
> > ++#   - Make a upload target for a upload command
> > ++#     Arguments:
> > ++#     + cmd: Command to do the
> > ++#     + fileAlias: File alias which will be used as part of target na=
me
> > ++#     + DEPENDS files: Extra files that the upload load target depend=
s on.
> > ++#     + HOST_ALIAS hostAlias: (Optional) Host alias which will be use=
d as part of target name.
> > ++#     + HOST_URL hostUrl: Host URL
> > ++#     + REMOTE_DIR remoteDir: (Optional) Remote dir/
> > ++#     + UPLOAD_FILES files : Files to be uploaded. The target depends=
 on these files.
> > ++#     + UPLOAD_OPTIONS options: Options for upload command.
> > ++#     + USER user: (Optional) User for uploading
> > ++#
> > ++#   MANAGE_UPLOAD_SFTP(fileAlias [USER user] [HOST_URL hostUrl]
> > ++#     [HOST_ALIAS hostAlias] [UPLOAD_FILES files] [REMOTE_DIR remoteD=
ir]
> > ++#     [UPLOAD_OPTIONS options] [DEPENDS files])
> > ++#   - Make a upload target for sftp
> > ++#     Arguments: See section MANAGE_UPLOAD_CMD
> > ++#
> > ++#   MANAGE_UPLOAD_SCP(fileAlias [USER user] [HOST_URL hostUrl]
> > ++#     [HOST_ALIAS hostAlias] [UPLOAD_FILES files] [REMOTE_DIR remoteD=
ir]
> > ++#     [UPLOAD_OPTIONS options] [DEPENDS files])
> > ++#   - Make a upload target for scp
> > ++#     Arguments: See section MANAGE_UPLOAD_CMD
> > ++#
> > ++#   MANAGE_UPLOAD_FEDORAHOSTED(fileAlias [USER user]
> > ++#     [UPLOAD_FILES files] [REMOTE_DIR remoteDir]
> > ++#     [UPLOAD_OPTIONS options] [DEPENDS files])
> > ++#   - Make a upload target for uploading to FedoraHosted
> > ++#     Arguments: See section MANAGE_UPLOAD_CMD
> > ++#
> > ++#   MANAGE_UPLOAD_SOURCEFORGE(fileAlias [USER user]
> > ++#     [UPLOAD_FILES files] [REMOTE_DIR remoteDir]
> > ++#     [UPLOAD_OPTIONS options] [DEPENDS files])
> > ++#   - Make a upload target for uploading to SourceForge
> > ++#     Arguments: See section MANAGE_UPLOAD_CMD
> > ++#
> > ++#
> > ++
> > ++IF(NOT DEFINED _MANAGE_UPLOAD_CMAKE_)
> > ++    SET(_MANAGE_UPLOAD_CMAKE_ "DEFINED")
> > ++    INCLUDE(ManageMessage)
> > ++
> > ++    # MANAGE_UPLOAD_GET_OPTIONS cmd [USER user] [HOST_URL hostUrl] [H=
OST_ALIAS hostAlias]
> > ++    #  [UPLOAD_FILES files] [REMOTE_DIR remoteDir] [UPLOAD_OPTIONS sf=
tpOptions] [DEPENDS files]
> > ++
> > ++    MACRO(_MANAGE_UPLOAD_GET_OPTIONS varList varPrefix)
> > ++      SET(_optName "")        ## OPTION name
> > ++      SET(_opt "")            ## Variable that hold option values
> > ++      SET(VALID_OPTIONS "USER" "HOST_URL" "HOST_ALIAS" "UPLOAD_FILES"=
 "REMOTE_DIR" "UPLOAD_OPTIONS" "DEPENDS")
> > ++      FOREACH(_arg ${ARGN})
> > ++          LIST(FIND VALID_OPTIONS "${_arg}" _optIndex)
> > ++          IF(_optIndex EQUAL -1)
> > ++              IF(NOT _optName STREQUAL "")
> > ++                  ## Append to existing variable
> > ++                  LIST(APPEND ${_opt} "${_arg}")
> > ++                  SET(${_opt} "${_opt}" PARENT_SCOPE)
> > ++              ENDIF(NOT _optName STREQUAL "")
> > ++          ELSE(_optIndex EQUAL -1)
> > ++              ## Obtain option name and variable name
> > ++              LIST(GET VALID_OPTIONS  ${_optIndex} _optName)
> > ++              SET(_opt "${varPrefix}_${_optName}")
> > ++
> > ++              ## If variable is not in varList, then set cache and ad=
d it to varList
> > ++              LIST(FIND ${varList} "${_opt}" _varIndex)
> > ++              IF(_varIndex EQUAL -1)
> > ++                  SET(${_opt} "" PARENT_SCOPE)
> > ++                  LIST(APPEND ${varList} "${_opt}")
> > ++              ENDIF(_varIndex EQUAL -1)
> > ++          ENDIF(_optIndex EQUAL -1)
> > ++      ENDFOREACH(_arg ${ARGN})
> > ++    ENDMACRO(_MANAGE_UPLOAD_GET_OPTIONS varPrefix varList)
> > ++
> > ++    MACRO(MANAGE_UPLOAD_MAKE_TARGET varPrefix fileAlias)
> > ++      SET(_target "upload")
> > ++      IF(NOT "${varPrefix}_HOST_ALIAS" STREQUAL "")
> > ++          SET(_target "${_target}_${${varPrefix}_HOST_ALIAS}")
> > ++      ENDIF(NOT "${varPrefix}_HOST_ALIAS" STREQUAL "")
> > ++      SET(_target "${_target}_${fileAlias}")
> > ++
> > ++      ## Determine url for upload
> > ++      IF(NOT "${varPrefix}_HOST_URL" STREQUAL "")
> > ++          IF("${varPrefix}_USER" STREQUAL "")
> > ++              SET(UPLOAD_URL "${${varPrefix}_USER}@${${varPrefix}_HOS=
T_URL}")
> > ++          ELSE("${varPrefix}_USER" STREQUAL "")
> > ++              SET(UPLOAD_URL "${${varPrefix}_HOST_URL}")
> > ++          ENDIF("${varPrefix}_USER" STREQUAL "")
> > ++      ELSE(NOT "${varPrefix}_HOST_URL" STREQUAL "")
> > ++          SET(UPLOAD_URL "")
> > ++      ENDIF(NOT "${varPrefix}_HOST_URL" STREQUAL "")
> > ++
> > ++      IF(NOT "${varPrefix}_REMOTE_DIR" STREQUAL "")
> > ++          SET(UPLOAD_URL "${UPLOAD_URL}:${${varPrefix}_REMOTE_DIR}")
> > ++      ENDIF(NOT "${varPrefix}_REMOTE_DIR" STREQUAL "")
> > ++
> > ++      ADD_CUSTOM_TARGET(${_target}
> > ++          COMMAND ${${varPrefix}_UPLOAD_CMD} ${${varPrefix}_UPLOAD_OP=
TIONS} ${ARGN} ${UPLOAD_URL}
> > ++          DEPENDS ${${varPrefix}_UPLOAD_FILES} ${${varPrefix}_DEPENDS=
}
> > ++          ${_DEPENDS}
> > ++          COMMENT "${${varPrefix}_HOST_ALIAS} uploading ${fileAlias}.=
"
> > ++          VERBATIM
> > ++          )
> > ++    ENDMACRO(MANAGE_UPLOAD_MAKE_TARGET varPrefix fileAlias)
> > ++
> > ++    FUNCTION(MANAGE_UPLOAD_CMD cmd fileAlias)
> > ++      FIND_PROGRAM(UPLOAD_CMD "${cmd}")
> > ++      IF(UPLOAD_CMD STREQUAL "UPLOAD_CMD-NOTFOUND")
> > ++          M_MSG(${M_OFF} "Program ${cmd} is not found! Upload with ${=
cmd} disabled.")
> > ++      ELSE(UPLOAD_CMD STREQUAL "UPLOAD_CMD-NOTFOUND")
> > ++          _MANAGE_UPLOAD_GET_OPTIONS(varList "upload_${fileAlias}" ${=
ARGN})
> > ++          SET(upload_UPLOAD_CMD ${UPLOAD_CMD})
> > ++          MANAGE_UPLOAD_MAKE_TAGET("upload" "${fileAlias}")
> > ++      ENDIF(UPLOAD_CMD STREQUAL "UPLOAD_CMD-NOTFOUND")
> > ++    ENDFUNCTION(MANAGE_UPLOAD_CMD cmd fileAlias)
> > ++
> > ++    FUNCTION(MANAGE_UPLOAD_SFTP fileAlias)
> > ++      MANAGE_UPLOAD_CMD(sftp ${fileAlias} ${ARGN})
> > ++    ENDFUNCTION(MANAGE_UPLOAD_SFTP fileAlias)
> > ++
> > ++    FUNCTION(MANAGE_UPLOAD_SCP fileAlias)
> > ++      MANAGE_UPLOAD_CMD(scp ${fileAlias} ${ARGN})
> > ++    ENDFUNCTION(MANAGE_UPLOAD_SCP fileAlias)
> > ++
> > ++    #MACRO(MANAGE_UPLOAD_GOOGLE_UPLOAD)
> > ++    # FIND_PROGRAM(CURL_CMD curl)
> > ++    # IF(CURL_CMD STREQUAL "CURL_CMD-NOTFOUND")
> > ++    #     MESSAGE(FATAL_ERROR "Need curl to perform google upload")
> > ++    # ENDIF(CURL_CMD STREQUAL "CURL_CMD-NOTFOUND")
> > ++    #ENDMACRO(MANAGE_UPLOAD_GOOGLE_UPLOAD)
> > ++    FUNCTION(MANAGE_UPLOAD_FEDORAHOSTED fileAlias)
> > ++      FIND_PROGRAM(fedorahosted_${fileAlias}_UPLOAD_CMD "scp")
> > ++      IF(fedorahosted_${fileAlias}_UPLOAD_CMD STREQUAL "fedorahosted_=
${fileAlias}_UPLOAD_CMD-NOTFOUND")
> > ++          M_MSG(${M_OFF} "Program ${cmd} is not found! Upload with fe=
dorahost disabled.")
> > ++      ELSE(fedorahosted_${fileAlias}_UPLOAD_CMD STREQUAL "fedorahoste=
d_${fileAlias}_UPLOAD_CMD-NOTFOUND")
> > ++          _MANAGE_UPLOAD_GET_OPTIONS(varList "fedorahosted_${fileAlia=
s}" HOST_ALIAS "fedorahosted"
> > ++              HOST_URL "fedorahosted.org" REMOTE_DIR  "${PROJECT_NAME=
}" ${ARGN})
> > ++      MANAGE_UPLOAD_MAKE_TARGET("fedorahosted_${fileAlias}" "${fileAl=
ias}" ${fedorahosted_${fileAlias}_UPLOAD_FILES})
> > ++      ENDIF(fedorahosted_${fileAlias}_UPLOAD_CMD STREQUAL "fedorahost=
ed_${fileAlias}_UPLOAD_CMD-NOTFOUND")
> > ++    ENDFUNCTION(MANAGE_UPLOAD_FEDORAHOSTED fileAlias)
> > ++
> > ++    FUNCTION(MANAGE_UPLOAD_SOURCEFORGE_FILE_RELEASE fileAlias)
> > ++      FIND_PROGRAM(sourceforge_${fileAlias}_UPLOAD_CMD "sftp")
> > ++      IF(sourceforge_${fileAlias}_UPLOAD_CMD STREQUAL "sourceforge_${=
fileAlias}_UPLOAD_CMD-NOTFOUND")
> > ++          M_MSG(${M_OFF} "Program ${cmd} is not found! Upload with so=
urceforge disabled.")
> > ++      ELSE(sourceforge_${fileAlias}_UPLOAD_CMD STREQUAL "sourceforge_=
${fileAlias}_UPLOAD_CMD-NOTFOUND")
> > ++          _MANAGE_UPLOAD_GET_OPTIONS(varList "sourceforge_${fileAlias=
}" ${ARGN} HOST_ALIAS "sourceforge"
> > ++              HOST_URL "frs.sourceforge.net")
> > ++          IF(sourceforge_${fileAlias}_USER)
> > ++              SET(sourceforge_${fileAlias}_REMOTE_DIR "/home/frs/proj=
ect/${PROJECT_NAME}")
> > ++          ENDIF(sourceforge_${fileAlias}_USER)
> > ++          SET("sourceforge_${fileAlias}_UPLOAD_CMD" "sftp")
> > ++      MANAGE_UPLOAD_MAKE_TARGET("sourceforge_${fileAlias}" "${fileAli=
as}")
> > ++    ENDIF(sourceforge_${fileAlias}_UPLOAD_CMD STREQUAL "sourceforge_$=
{fileAlias}_UPLOAD_CMD-NOTFOUND")
> > ++    ENDFUNCTION(MANAGE_UPLOAD_SOURCEFORGE_FILE_RELEASE fileAlias)
> > ++ENDIF(NOT DEFINED _MANAGE_UPLOAD_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageVariable.cmake
> > +@@ -0,0 +1,326 @@
> > ++# - Get or set variables from various sources.
> > ++#
> > ++# Includes:
> > ++#   ManageString
> > ++#
> > ++# Included by:
> > ++#   ManageVersion
> > ++#   PackRPM
> > ++#
> > ++# Defines following functions:
> > ++#   SETTING_STRING_GET_VARIABLE(var value str [NOUNQUOTE] [NOREPLACE]=
 [setting_sign])
> > ++#     - Get a variable and a value from a setting in string format.
> > ++#       i.e.  VAR=3DValue
> > ++#       pattern. '#' is used for comment.
> > ++#       * Parameters:
> > ++#         + var: Variable name extracted from str.
> > ++#         + value: Value extracted from str
> > ++#         + str: String to be extracted variable and value from.
> > ++#         + NOUNQUOTE: (Optional) do not remove the double quote mark=
 around the string.
> > ++#         + NOREPLACE (Optional) Without this parameter, this macro r=
eplaces
> > ++#           previous defined variables, use NOREPLACE to prevent this=
.
> > ++#         + NOESCAPE_SEMICOLON: (Optional) do not escape semicolons.
> > ++#         + setting_sign: (Optional) The symbol that separate attribu=
te name and its value.
> > ++#           Default value: "=3D"
> > ++#
> > ++# Defines following macros:
> > ++#   COMMAND_OUTPUT_TO_VARIABLE(var cmd)
> > ++#     - Store command output to a variable, without new line characte=
rs (\n and \r).
> > ++#       This macro is suitable for command that output one line resul=
t.
> > ++#       Note that the var will be set to ${var_name}-NOVALUE if cmd d=
oes not have
> > ++#       any output.
> > ++#       * Parameters:
> > ++#         var: A variable that stores the result.
> > ++#         cmd: A command.
> > ++#
> > ++#   SETTING_FILE_GET_VARIABLES_PATTERN(var attr_pattern setting_file =
[NOUNQUOTE] [NOREPLACE]
> > ++#     [NOESCAPE_SEMICOLON] [setting_sign])
> > ++#     - Get variable values from a setting file if their names matche=
s given
> > ++#       pattern. '#' is used for comment.
> > ++#       * Parameters:
> > ++#         + var: Variable to store the attribute value.
> > ++#           Set to "" to set attribute under matched variable name.
> > ++#         + attr_pattern: Regex pattern of variable name.
> > ++#         + setting_file: Setting filename.
> > ++#         + NOUNQUOTE: (Optional) do not remove the double quote mark=
 around the string.
> > ++#         + NOREPLACE (Optional) Without this parameter, this macro r=
eplaces
> > ++#           previous defined variables, use NOREPLACE to prevent this=
.
> > ++#         + NOESCAPE_SEMICOLON: (Optional) do not escape semicolons.
> > ++#         + setting_sign: (Optional) The symbol that separate attribu=
te name and its value.
> > ++#           Default value: "=3D"
> > ++#
> > ++#   SETTING_FILE_GET_ALL_VARIABLES(setting_file [NOUNQUOTE] [NOREPLAC=
E]
> > ++#     [NOESCAPE_SEMICOLON] [setting_sign])
> > ++#     - Get all variable values from a setting file.
> > ++#       It is equivalent to:
> > ++#       SETTING_FILE_GET_VARIABLES_PATTERN("" "[A-Za-z_][A-Za-z0-9_]*=
"
> > ++#        "${setting_file}" ${ARGN})
> > ++#      '#' is used to comment out setting.
> > ++#       * Parameters:
> > ++#         + setting_file: Setting filename.
> > ++#         + NOUNQUOTE: (Optional) do not remove the double quote mark=
 around the string.
> > ++#         + NOREPLACE (Optional) Without this parameter, this macro r=
eplaces
> > ++#           previous defined variables, use NOREPLACE to prevent this=
.
> > ++#         + NOESCAPE_SEMICOLON: (Optional) Do not escape semicolons.
> > ++#         + setting_sign: (Optional) The symbol that separate attribu=
te name and its value.
> > ++#           Default value: "=3D"
> > ++#
> > ++#   SETTING_FILE_GET_VARIABLE(var attr_name setting_file [NOUNQUOTE] =
[NOREPLACE]
> > ++#     [NOESCAPE_SEMICOLON] [setting_sign])
> > ++#     - Get a variable value from a setting file.
> > ++#       It is equivalent to:
> > ++#     SETTING_FILE_GET_VARIABLES_PATTERN(${var} "${attr_name}"
> > ++#         "${setting_file}" ${ARGN})
> > ++#      '#' is used to comment out setting.
> > ++#       * Parameters:
> > ++#         + var: Variable to store the attribute value.
> > ++#         + attr_name: Name of the variable.
> > ++#         + setting_file: Setting filename.
> > ++#         + NOUNQUOTE: (Optional) do not remove the double quote mark=
 around the string.
> > ++#         + NOREPLACE (Optional) Without this parameter, this macro r=
eplaces
> > ++#           previous defined variables, use NOREPLACE to prevent this=
.
> > ++#         + NOESCAPE_SEMICOLON: (Optional) do not escape semicolons.
> > ++#         + setting_sign: (Optional) The symbol that separate attribu=
te name and its value.
> > ++#           Default value: "=3D"
> > ++#
> > ++#   SETTING_FILE_GET_ALL_VARIABLES(setting_file [NOUNQUOTE] [NOREPLAC=
E]
> > ++#     [NOESCAPE_SEMICOLON] [setting_sign])
> > ++#     - Get all attribute values from a setting file.
> > ++#       '#' is used to comment out setting.
> > ++#       * Parameters:
> > ++#         + setting_file: Setting filename.
> > ++#         + NOUNQUOTE: (Optional) do not remove the double quote mark=
 around the string.
> > ++#         + NOREPLACE (Optional) Without this parameter, this macro r=
eplaces
> > ++#           previous defined variables, use NOREPLACE to prevent this=
.
> > ++#         + NOESCAPE_SEMICOLON: (Optional) Do not escape semicolons.
> > ++#         + setting_sign: (Optional) The symbol that separate attribu=
te name and its value.
> > ++#           Default value: "=3D"
> > ++#
> > ++#   GET_ENV(var default_value [env])
> > ++#     - Get the value of a environment variable, or use default
> > ++#       if the environment variable does not exist or is empty.
> > ++#       * Parameters:
> > ++#         var: Variable to be set
> > ++#         default_value: Default value of the var
> > ++#         env: (Optional) The name of environment variable. Only need=
 if different from var.
> > ++#
> > ++#   SET_VAR(var untrimmed_value)
> > ++#     - Trim an set the value to a variable.
> > ++#       * Parameters:
> > ++#         var: Variable to be set
> > ++#         untrimmed_value: Untrimmed values that may have space, \t, =
\n, \r in the front or back of the string.
> > ++#
> > ++
> > ++IF(NOT DEFINED _MANAGE_VARIABLE_CMAKE_)
> > ++    SET(_MANAGE_VARIABLE_CMAKE_ "DEFINED")
> > ++    INCLUDE(ManageString)
> > ++
> > ++    MACRO(COMMAND_OUTPUT_TO_VARIABLE var cmd)
> > ++      EXECUTE_PROCESS(
> > ++          COMMAND ${cmd} ${ARGN}
> > ++          OUTPUT_VARIABLE _cmd_output
> > ++          OUTPUT_STRIP_TRAILING_WHITESPACE
> > ++          )
> > ++      IF(_cmd_output)
> > ++          SET(${var} ${_cmd_output})
> > ++      ELSE(_cmd_output)
> > ++          SET(var "${var}-NOVALUE")
> > ++      ENDIF(_cmd_output)
> > ++      #SET(value ${${var}})
> > ++      #MESSAGE("var=3D${var} _cmd_output=3D${_cmd_output} value=3D|${=
value}|" )
> > ++    ENDMACRO(COMMAND_OUTPUT_TO_VARIABLE var cmd)
> > ++
> > ++    # This macro is meant to be internal.
> > ++    MACRO(_MANAGE_VARIABLE_SET var value)
> > ++      SET(${var} "${value}")
> > ++    ENDMACRO(_MANAGE_VARIABLE_SET var value)
> > ++
> > ++    # it deals the "encoded" line.
> > ++    FUNCTION(SETTING_STRING_GET_VARIABLE var value str )
> > ++      SET(setting_sign "=3D")
> > ++      SET(_NOUNQUOTE "")
> > ++      SET(_NOREPLACE "")
> > ++      FOREACH(_arg ${ARGN})
> > ++          IF (${_arg} STREQUAL "NOUNQUOTE")
> > ++              SET(_NOUNQUOTE "NOUNQUOTE")
> > ++          ELSEIF (${_arg} STREQUAL "NOREPLACE")
> > ++              SET(_NOREPLACE "NOREPLACE")
> > ++          ELSE(${_arg} STREQUAL "NOUNQUOTE")
> > ++              SET(setting_sign ${_arg})
> > ++          ENDIF(${_arg} STREQUAL "NOUNQUOTE")
> > ++      ENDFOREACH(_arg ${ARGN})
> > ++
> > ++      STRING_SPLIT(_tokens "${setting_sign}" "${str}" 2)
> > ++      #MESSAGE("_tokens=3D${_tokens}")
> > ++      SET(_varName "")
> > ++      SET(_val "")
> > ++      FOREACH(_token ${_tokens})
> > ++          #MESSAGE("_varName=3D${_varName} _token=3D${_token}")
> > ++          IF(_varName STREQUAL "")
> > ++              SET(_varName "${_token}")
> > ++          ELSE(_varName STREQUAL "")
> > ++              SET(_val "${_token}")
> > ++          ENDIF(_varName STREQUAL "")
> > ++      ENDFOREACH(_token ${_tokens})
> > ++      #MESSAGE("_varName=3D${_varName} _val=3D${_val}")
> > ++
> > ++      SET(${var} "${_varName}" PARENT_SCOPE)
> > ++      # Set var when
> > ++      # 1. NOREPLACE is not set, or
> > ++      # 2. var has value already.
> > ++      SET(_setVar 0)
> > ++      IF(_NOREPLACE STREQUAL "")
> > ++          STRING_TRIM(_value "${_val}" ${_NOUNQUOTE})
> > ++      ELSEIF(${var} STREQUAL "")
> > ++          STRING_TRIM(_value "${_val}" ${_NOUNQUOTE})
> > ++      ELSE(_NOREPLACE STREQUAL "")
> > ++          SET(_value "${${var}}")
> > ++      ENDIF(_NOREPLACE STREQUAL "")
> > ++      SET(${value} "${_value}" PARENT_SCOPE)
> > ++      #MESSAGE("_varName=3D${_varName} _value=3D${_value}")
> > ++
> > ++    ENDFUNCTION(SETTING_STRING_GET_VARIABLE var str)
> > ++
> > ++    # Internal macro
> > ++    # Similar to STRING_ESCAPE, but read directly from file,
> > ++    # This avoid the variable substitution
> > ++    # Variable escape is enforced.
> > ++    MACRO(FILE_READ_ESCAPE var filename)
> > ++      # '$' is very tricky.
> > ++      # '$' =3D> '#D'
> > ++      GET_FILENAME_COMPONENT(_filename_abs "${filename}" ABSOLUTE)
> > ++      EXECUTE_PROCESS(COMMAND cat ${filename}
> > ++          COMMAND sed -e "s/#/#H/g"
> > ++          COMMAND sed -e "s/[$]/#D/g"
> > ++          COMMAND sed -e "s/;/#S/g"
> > ++          COMMAND sed -e "s/[\\]/#B/g"
> > ++          OUTPUT_VARIABLE _ret
> > ++          OUTPUT_STRIP_TRAILING_WHITESPACE)
> > ++
> > ++      STRING(REGEX REPLACE "\n" ";" _ret "${_ret}")
> > ++      #MESSAGE("_ret=3D|${_ret}|")
> > ++      SET(${var} "${_ret}")
> > ++    ENDMACRO(FILE_READ_ESCAPE var filename)
> > ++
> > ++    MACRO(SETTING_FILE_GET_VARIABLES_PATTERN var attr_pattern setting=
_file)
> > ++      IF("${setting_file}" STREQUAL "")
> > ++          M_MSG(${M_FATAL} "SETTING_FILE_GET_VARIABLES_PATTERN: setti=
ng_file ${setting_file} is empty")
> > ++      ENDIF("${setting_file}" STREQUAL "")
> > ++      SET(setting_sign "=3D")
> > ++      SET(_noUnQuoted "")
> > ++      SET(_noEscapeSemicolon "")
> > ++      SET(_noReplace "")
> > ++      SET(_escapeVariable "")
> > ++      FOREACH(_arg ${ARGN})
> > ++          IF (${_arg} STREQUAL "NOUNQUOTE")
> > ++              SET(_noUnQuoted "NOUNQUOTE")
> > ++          ELSEIF (${_arg} STREQUAL "NOREPLACE")
> > ++              SET(_noReplace "NOREPLACE")
> > ++          ELSEIF (${_arg} STREQUAL "NOESCAPE_SEMICOLON")
> > ++              SET(_noEscapeSemicolon "NOESCAPE_SEMICOLON")
> > ++          ELSEIF (${_arg} STREQUAL "ESCAPE_VARIABLE")
> > ++              SET(_escapeVariable "ESCAPE_VARIABLE")
> > ++          ELSE(${_arg} STREQUAL "NOUNQUOTE")
> > ++              SET(setting_sign ${_arg})
> > ++          ENDIF(${_arg} STREQUAL "NOUNQUOTE")
> > ++      ENDFOREACH(_arg)
> > ++
> > ++      # Escape everything to be safe.
> > ++      FILE_READ_ESCAPE(_lines "${setting_file}")
> > ++
> > ++      #STRING_SPLIT(_lines "\n" "${_txt_content}")
> > ++      #MESSAGE("_lines=3D|${_lines}|")
> > ++      SET(_actual_line "")
> > ++      SET(_join_next 0)
> > ++      FOREACH(_line ${_lines})
> > ++          #MESSAGE("_line=3D|${_line}|")
> > ++          IF(NOT _line MATCHES "^[ \\t]*#H")
> > ++              # Not a comment line.
> > ++              IF(_join_next EQUAL 1)
> > ++                  SET(_actual_line "${_actual_line}${_line}" )
> > ++              ELSE(_join_next EQUAL 1)
> > ++                  SET(_actual_line "${_line}")
> > ++              ENDIF(_join_next EQUAL 1)
> > ++              #MESSAGE("_actual_line=3D|${_actual_line}|")
> > ++
> > ++              IF(_actual_line MATCHES "#B$")
> > ++                  #Join the lines that end with \\
> > ++                  SET(_join_next 1)
> > ++                  STRING(REGEX REPLACE "#B$" "" _actual_line "${_actu=
al_line}")
> > ++              ELSE(_actual_line MATCHES "#B$")
> > ++                  SET(_join_next 0)
> > ++                  IF(_actual_line MATCHES "[ \\t]*${attr_pattern}[ \\=
t]*${setting_sign}")
> > ++                      #MESSAGE("*** matched_line=3D|${_actual_line}|"=
)
> > ++                      SETTING_STRING_GET_VARIABLE(_attr _value
> > ++                          "${_actual_line}" ${setting_sign} ${_noUnQu=
oted} )
> > ++                      #MESSAGE("*** _attr=3D${_attr} _value=3D${_valu=
e}")
> > ++                      IF(_noReplace STREQUAL "" OR NOT DEFINED ${_att=
r})
> > ++                          # Unencoding
> > ++                          _STRING_UNESCAPE(_value "${_value}" ${_noEs=
capeSemicolon} ESCAPE_VARIABLE)
> > ++                          IF(_escapeVariable STREQUAL "")
> > ++                              # Variable should not be escaped
> > ++                              # i.e. need substitution
> > ++                              _MANAGE_VARIABLE_SET(_value "${_value}"=
)
> > ++                          ENDIF(_escapeVariable STREQUAL "")
> > ++                          IF("${var}" STREQUAL "")
> > ++                              SET(${_attr} "${_value}")
> > ++                          ELSE("${var}" STREQUAL "")
> > ++                              SET(${var} "${_value}")
> > ++                          ENDIF("${var}" STREQUAL "")
> > ++                      ENDIF(_noReplace STREQUAL "" OR NOT DEFINED ${_=
attr})
> > ++                  ENDIF(_actual_line MATCHES "[ \\t]*${attr_pattern}[=
 \\t]*${setting_sign}")
> > ++
> > ++              ENDIF(_actual_line MATCHES "#B$")
> > ++
> > ++          ENDIF(NOT _line MATCHES "^[ \\t]*#H")
> > ++      ENDFOREACH(_line ${_lines})
> > ++      #SET(${var} "${_value}")
> > ++
> > ++    ENDMACRO(SETTING_FILE_GET_VARIABLES_PATTERN var attr_pattern sett=
ing_file)
> > ++
> > ++    MACRO(SETTING_FILE_GET_VARIABLE var attr_name setting_file)
> > ++      SETTING_FILE_GET_VARIABLES_PATTERN(${var} "${attr_name}"
> > ++          "${setting_file}" ${ARGN})
> > ++    ENDMACRO(SETTING_FILE_GET_VARIABLE var attr_name setting_file)
> > ++
> > ++    MACRO(SETTING_FILE_GET_ALL_VARIABLES setting_file)
> > ++      SETTING_FILE_GET_VARIABLES_PATTERN("" "[A-Za-z_][A-Za-z0-9_.]*"
> > ++          "${setting_file}" ${ARGN})
> > ++    ENDMACRO(SETTING_FILE_GET_ALL_VARIABLES setting_file)
> > ++
> > ++    MACRO(GET_ENV var default_value)
> > ++      IF(${ARGC} GREATER 2)
> > ++          SET(_env "${ARGV2}")
> > ++      ELSE(${ARGC} GREATER 2)
> > ++          SET(_env "${var}")
> > ++      ENDIF(${ARGC} GREATER 2)
> > ++
> > ++      IF ("$ENV{${_env}}" STREQUAL "")
> > ++          SET(${var} "${default_value}")
> > ++      ELSE("$ENV{${_env}}" STREQUAL "")
> > ++          SET(${var} "$ENV{${_env}}")
> > ++      ENDIF("$ENV{${_env}}" STREQUAL "")
> > ++      # MESSAGE("Variable ${var}=3D${${var}}")
> > ++    ENDMACRO(GET_ENV var default_value)
> > ++
> > ++    MACRO(SET_VAR var untrimmedValue)
> > ++      SET(_noUnQuoted "")
> > ++      FOREACH(_arg ${ARGN})
> > ++          IF (${_arg} STREQUAL "NOUNQUOTE")
> > ++              SET(_noUnQuoted "NOUNQUOTE")
> > ++          ENDIF(${_arg} STREQUAL "NOUNQUOTE")
> > ++      ENDFOREACH(_arg ${ARGN})
> > ++      #MESSAGE("untrimmedValue=3D${untrimmedValue}")
> > ++      IF ("${untrimmedValue}" STREQUAL "")
> > ++          SET(${var} "")
> > ++      ELSE("${untrimmedValue}" STREQUAL "")
> > ++          STRING_TRIM(trimmedValue "${untrimmedValue}" ${_noUnQuoted}=
)
> > ++          #MESSAGE("***SET_VAR: trimmedValue=3D${trimmedValue}")
> > ++          SET(${var} "${trimmedValue}")
> > ++      ENDIF("${untrimmedValue}" STREQUAL "")
> > ++      #SET(value "${${var}}")
> > ++      #MESSAGE("***SET_VAR: ${var}=3D|${value}|")
> > ++    ENDMACRO(SET_VAR var untrimmedValue)
> > ++
> > ++ENDIF(NOT DEFINED _MANAGE_VARIABLE_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/ManageVersion.cmake
> > +@@ -0,0 +1,137 @@
> > ++# - Modules for manipulate version and ChangeLogs
> > ++#
> > ++# Includes:
> > ++#   ManageVariable
> > ++#   DateTimeFormat
> > ++#
> > ++# Included by:
> > ++#   PackSource
> > ++#
> > ++# Defines following functions:
> > ++#   RELEASE_NOTES_READ_FILE([releaseFile])
> > ++#   - Load release file information.
> > ++#     Arguments:
> > ++#     + releaseFile: (Optional) release file to be read.
> > ++#       This file should contain following definition:
> > ++#       + PRJ_VER: Release version.
> > ++#       + SUMMARY: Summary of the release. Will be output as CHANGE_S=
UMMARY.
> > ++#          and a [Changes] section tag, below which listed the change=
 in the
> > ++#          release.
> > ++#       Default:RELEASE-NOTES.txt
> > ++#     This macro reads or define following variables:
> > ++#     + RELEASE_TARGETS: Sequence of release targets.
> > ++#     This macro outputs following files:
> > ++#     + ChangeLog: Log of changes.
> > ++#       Depends on ChangeLog.prev and releaseFile.
> > ++#     This macro sets following variables:
> > ++#     + PRJ_VER: Release version.
> > ++#     + CHANGE_SUMMARY: Summary of changes.
> > ++#     + CHANGELOG_ITEMS: Lines below the [Changes] tag.
> > ++#     + RELEASE_NOTES_FILE: The loaded release file.
> > ++#     + PRJ_DOC_DIR: Documentation for the project.
> > ++#       Default: ${DOC_DIR}/${PROJECT_NAME}-${PRJ_VER}
> > ++#
> > ++#
> > ++
> > ++IF(NOT DEFINED _MANAGE_VERSION_CMAKE_)
> > ++    SET(_MANAGE_VERSION_CMAKE_ "DEFINED")
> > ++    INCLUDE(ManageMessage)
> > ++    INCLUDE(ManageVariable)
> > ++
> > ++    SET(CHANGELOG_FILE "${CMAKE_BINARY_DIR}/ChangeLog" CACHE FILEPATH
> > ++      "ChangeLog")
> > ++    SET(CHANGELOG_PREV_FILE "${CMAKE_SOURCE_DIR}/ChangeLog.prev" CACH=
E FILEPATH
> > ++      "ChangeLog.prev")
> > ++
> > ++    ADD_CUSTOM_TARGET(changelog_prev_update
> > ++      COMMAND ${CMAKE_COMMAND} -E copy ${CHANGELOG_FILE} ${CHANGELOG_=
PREV_FILE}
> > ++      DEPENDS ${CHANGELOG_FILE}
> > ++      COMMENT "${CHANGELOG_FILE} are saving as ${CHANGELOG_PREV_FILE}=
"
> > ++      )
> > ++
> > ++    FUNCTION(RELEASE_NOTES_READ_FILE)
> > ++      FOREACH(_arg ${ARGN})
> > ++          IF(EXISTS ${_arg})
> > ++              SET(RELEASE_NOTES_FILE ${_arg} CACHE FILEPATH "Release =
File")
> > ++          ENDIF(EXISTS ${_arg})
> > ++      ENDFOREACH(_arg ${ARGN})
> > ++
> > ++      IF(NOT RELEASE_NOTES_FILE)
> > ++          SET(RELEASE_NOTES_FILE "RELEASE-NOTES.txt" CACHE FILEPATH "=
Release Notes")
> > ++      ENDIF(NOT RELEASE_NOTES_FILE)
> > ++
> > ++      FILE(STRINGS "${RELEASE_NOTES_FILE}" _release_lines)
> > ++
> > ++      SET(_changeItemSection 0)
> > ++      SET(_changeItems "")
> > ++      ## Parse release file
> > ++      FOREACH(_line ${_release_lines})
> > ++          IF(_changeItemSection)
> > ++              ### Append lines in change section
> > ++              IF(_changeItems)
> > ++                  SET(_changeItems  "${_changeItems}\n${_line}")
> > ++              ELSE(_changeItems)
> > ++                  SET(_changeItems  "${_line}")
> > ++              ENDIF(_changeItems)
> > ++          ELSEIF("${_line}" MATCHES "^[[]Changes[]]")
> > ++              ### Start the change section
> > ++              SET(_changeItemSection 1)
> > ++          ELSE(_changeItemSection)
> > ++              ### Variable Setting section
> > ++              SETTING_STRING_GET_VARIABLE(var value "${_line}")
> > ++              #MESSAGE("var=3D${var} value=3D${value}")
> > ++              IF(NOT var MATCHES "#")
> > ++                  IF(var STREQUAL "PRJ_VER")
> > ++                      SET_COMPILE_ENV(${var} "${value}" CACHE STRING =
"Project Version" FORCE)
> > ++                  ELSEIF(var STREQUAL "SUMMARY")
> > ++                      SET(CHANGE_SUMMARY "${value}" CACHE STRING "Cha=
nge Summary" FORCE)
> > ++                  ELSE(var STREQUAL "PRJ_VER")
> > ++                      SET(${var} "${value}" CACHE STRING "${var}" FOR=
CE)
> > ++                  ENDIF(var STREQUAL "PRJ_VER")
> > ++              ENDIF(NOT var MATCHES "#")
> > ++          ENDIF(_changeItemSection)
> > ++      ENDFOREACH(_line ${_release_line})
> > ++
> > ++      IF(_changeSection EQUAL 0)
> > ++          MESSAGE(FATAL_ERROR "${RELEASE_NOTES_FILE} does not have a =
[Changes] tag!")
> > ++      ELSEIF("${_changeItems}" STREQUAL "")
> > ++          MESSAGE(FATAL_ERROR "${RELEASE_NOTES_FILE} does not have Ch=
angeLog items!")
> > ++      ENDIF(_changeSection EQUAL 0)
> > ++
> > ++      FILE(WRITE "${CMAKE_FEDORA_TMP_DIR}/ChangeLog.this" "${_changeI=
tems}")
> > ++
> > ++      SET_COMPILE_ENV(PRJ_DOC_DIR "${DOC_DIR}/${PROJECT_NAME}-${PRJ_V=
ER}"
> > ++          CACHE PATH "Project docdir prefix" FORCE)
> > ++
> > ++      CHANGELOG_WRITE_FILE()
> > ++    ENDFUNCTION(RELEASE_NOTES_READ_FILE)
> > ++
> > ++    FUNCTION(CHANGELOG_WRITE_FILE)
> > ++      INCLUDE(DateTimeFormat)
> > ++
> > ++      FILE(WRITE ${CHANGELOG_FILE} "* ${TODAY_CHANGELOG} ${MAINTAINER=
} - ${PRJ_VER}\n")
> > ++      FILE(READ "${CMAKE_FEDORA_TMP_DIR}/ChangeLog.this" _changeLog_i=
tems)
> > ++
> > ++      FILE(APPEND ${CHANGELOG_FILE} "${_changeLog_items}\n\n")
> > ++      FILE(READ ${CHANGELOG_PREV_FILE} CHANGELOG_PREV)
> > ++      FILE(APPEND ${CHANGELOG_FILE} "${CHANGELOG_PREV}")
> > ++      SET(CMAKE_CACHE_TXT "${CMAKE_BINARY_DIR}/CMakeCache.txt")
> > ++
> > ++      ADD_CUSTOM_COMMAND(OUTPUT ${CHANGELOG_FILE}
> > ++          COMMAND ${CMAKE_COMMAND} ${CMAKE_SOURCE_DIR}
> > ++          DEPENDS ${RELEASE_NOTES_FILE} ${CHANGELOG_PREV_FILE}
> > ++          COMMENT "Building ${CHANGELOG_FILE}"
> > ++          VERBATIM
> > ++          )
> > ++
> > ++      ADD_CUSTOM_TARGET(changelog ALL
> > ++          DEPENDS ${CHANGELOG_FILE}
> > ++          VERBATIM
> > ++          )
> > ++
> > ++    ENDFUNCTION(CHANGELOG_WRITE_FILE)
> > ++
> > ++
> > ++
> > ++ENDIF(NOT DEFINED _MANAGE_VERSION_CMAKE_)
> > ++
> > +--- /dev/null
> > ++++ b/Modules/cmake_uninstall.cmake.in
> > +@@ -0,0 +1,21 @@
> > ++IF(NOT EXISTS "@CMAKE_CURRENT_BINARY_DIR@/install_manifest.txt")
> > ++  MESSAGE(FATAL_ERROR "Cannot find install manifest: \"@CMAKE_CURRENT=
_BINARY_DIR@/install_manifest.txt\"")
> > ++ENDIF(NOT EXISTS "@CMAKE_CURRENT_BINARY_DIR@/install_manifest.txt")
> > ++
> > ++FILE(READ "@CMAKE_CURRENT_BINARY_DIR@/install_manifest.txt" files)
> > ++STRING(REGEX REPLACE "\n" ";" files "${files}")
> > ++FOREACH(file ${files})
> > ++  MESSAGE(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
> > ++  IF(EXISTS "$ENV{DESTDIR}${file}")
> > ++    EXEC_PROGRAM(
> > ++      "@CMAKE_COMMAND@" ARGS "-E remove \"$ENV{DESTDIR}${file}\""
> > ++      OUTPUT_VARIABLE rm_out
> > ++      RETURN_VALUE rm_retval
> > ++      )
> > ++    IF(NOT "${rm_retval}" STREQUAL 0)
> > ++      MESSAGE(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${fil=
e}\"")
> > ++    ENDIF(NOT "${rm_retval}" STREQUAL 0)
> > ++  ELSE(EXISTS "$ENV{DESTDIR}${file}")
> > ++    MESSAGE(STATUS "File \"$ENV{DESTDIR}${file}\" does not exist.")
> > ++  ENDIF(EXISTS "$ENV{DESTDIR}${file}")
> > ++ENDFOREACH(file)
> > diff --git a/meta-oe/recipes-support/ibus/ibus-table-chinese/0003-add-C=
hangeLog.prev.patch b/meta-oe/recipes-support/ibus/ibus-table-chinese/0003-=
add-ChangeLog.prev.patch
> > new file mode 100644
> > index 000000000..27c585847
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/ibus/ibus-table-chinese/0003-add-ChangeLo=
g.prev.patch
> > @@ -0,0 +1,58 @@
> > +--- /dev/null
> > ++++ b/ChangeLog.prev
> > +@@ -0,0 +1,55 @@
> > ++* Mon Nov 26 2012 Ding-Yi Chen <dchen@redhat.com> - 1.4.5
> > ++- Table build scripts has been refactored.
> > ++- cmake-fedora is added as submodule.
> > ++- Fixed Bug 855250 - Change the default filtering for Quick and Cangj=
ie by
> > ++  merging maxiaojun's repository
> > ++- Fixed Google Issue 1405: failed to build ibus-table-chinese due to =
missing db files
> > ++- Fixed Google issue 1507: Add CJKV Extension C/D support for Array30
> > ++- Merge GitHub Pull request 3: Added the inter punct
> > ++- Merge GitHub Pull request 4: Give Cangjie and Quick users 9 candida=
tes per page
> > ++
> > ++* Fri Sep 07 2012 Ding-Yi Chen <dchen@redhat.com> - 1.4.0
> > ++- Table build scripts has been refactored.
> > ++- cmake-fedora is added as submodule.
> > ++- Fixed Bug 855250 - Change the default filtering for Quick and Cangj=
ie by
> > ++  merging maxiaojun's repository
> > ++- Fixed Google Issue 1405: failed to build ibus-table-chinese due to =
missing db files
> > ++
> > ++* Fri Oct 28 2011 Ding-Yi Chen <dchen@redhat.com> - 1.3.5
> > ++- Merge Caius Chance's branch for DYNAMIC_ADJUST
> > ++- Dependency update to cmake-0.8.1
> > ++
> > ++* Wed Aug 31 2011 Ding-Yi Chen <dchen@redhat.com> - 1.3.4
> > ++- Fixed Bug 715707 - FTBFS ibus-table-chinese-1.3.0.20110114-2.fc15
> > ++- Fixed Bug 629212 - bad candidate orders in ibus-table-quick
> > ++- Merged patch from sagara @ github, which address IBus issue 787
> > ++- Make it compatible with cmake-fedora-0.7.994
> > ++- Move the cmake policies to the front
> > ++- Suppress the misleading warning from rpm -V
> > ++
> > ++* Fri Jan 14 2011 Ding-Yi Chen <dchen@redhat.com> - 1.3.0.20110114
> > ++- Fix Bug 667877: ibus-table-yinma and ibus-table-xingma have been ob=
soleted.
> > ++- Now depends on cmake-fedora
> > ++
> > ++* Mon Dec 06 2010 Ding-Yi Chen <dchen@redhat.com> - 1.3.0.20101206
> > ++- New tables which was not include in original:
> > ++  + array30, array30-big, wubi-haifeng
> > ++- Table removed from original version because of license issues:
> > ++  + zhengma, ziranma
> > ++- Add package review ID
> > ++- Add build tag for el6
> > ++
> > ++* Fri Dec 03 2010 Ding-Yi Chen <dchen@redhat.com> - 1.3.0.20101201
> > ++- Support out-of-source build
> > ++- Remove ibus-table-chinese-all
> > ++
> > ++* Wed Jan 06 2010 Caius 'kaio' Chance <k at kaio.me> - 1.3.0.20100527
> > ++- Added Quick 3, 5, Classic tables and icons.
> > ++- Added Easy (big) table and icon.
> > ++- Updated AUTHORS, COPYING, license and its declarations.
> > ++- Added CangJie (big) table.
> > ++
> > ++* Wed Aug 19 2008 Yu Yuwei <acevery@gmail.com> - 1.3.0.20100527
> > ++- The first version.
> > ++
> > ++
> > diff --git a/meta-oe/recipes-support/ibus/ibus-table-chinese/0005-fix-c=
make-cross-compile.patch b/meta-oe/recipes-support/ibus/ibus-table-chinese/=
0005-fix-cmake-cross-compile.patch
> > new file mode 100644
> > index 000000000..0f814b765
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/ibus/ibus-table-chinese/0005-fix-cmake-cr=
oss-compile.patch
> > @@ -0,0 +1,130 @@
> > +diff -u -r ibus-table-chinese-1.8.2/tables/array/CMakeLists.txt new/ta=
bles/array/CMakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/array/CMakeLists.txt       2018-10=
-30 01:56:21.474548447 +0100
> > ++++ new/tables/array/CMakeLists.txt    2018-10-29 23:39:57.770116668 +=
0100
> > +@@ -16,7 +16,7 @@
> > +
> > + CONFIGURE_FILE(${ARRAY30_HEAD_IN} ${ARRAY30_BASE_HEAD} @ONLY)
> > +
> > +-CONVERT_ENCODING(${ARRAY30_BASE_UTF8} UTF16 array30_27489.txt)
> > ++CONVERT_ENCODING(${ARRAY30_BASE_UTF8} UTF16 ${CMAKE_CURRENT_SOURCE_DI=
R}/array30_27489.txt)
> > + GENERATE_FREQ(${ARRAY30_BASE_FREQ}
> > +     ${ARRAY30_BASE_UTF8}
> > +     )
> > +@@ -41,10 +41,10 @@
> > + CONFIGURE_FILE(${ARRAY30_HEAD_IN} ${ARRAY30_BIG_HEAD} @ONLY)
> > +
> > + SET(ARRAY30_EXT_B_UTF8 ${CMAKE_CURRENT_BINARY_DIR}/array30_ExtB.utf8)
> > +-CONVERT_ENCODING(${CMAKE_CURRENT_BINARY_DIR}/array30_ExtB.utf8 UTF16 =
array30_ExtB.txt)
> > ++CONVERT_ENCODING(${CMAKE_CURRENT_BINARY_DIR}/array30_ExtB.utf8 UTF16 =
${CMAKE_CURRENT_SOURCE_DIR}/array30_ExtB.txt)
> > +
> > + SET(ARRAY30_EXT_CD_UTF8 ${CMAKE_CURRENT_BINARY_DIR}/array30_ExtCD.utf=
8)
> > +-CONVERT_ENCODING(${CMAKE_CURRENT_BINARY_DIR}/array30_ExtCD.utf8 UTF16=
 array30_ExtCD_V2012A.txt)
> > ++CONVERT_ENCODING(${CMAKE_CURRENT_BINARY_DIR}/array30_ExtCD.utf8 UTF16=
 ${CMAKE_CURRENT_SOURCE_DIR}/array30_ExtCD_V2012A.txt)
> > +
> > + ADD_CUSTOM_COMMAND(OUTPUT ${ARRAY30_BIG_UTF8}
> > +     COMMAND cat ${ARRAY30_BASE_UTF8}
> > +Only in new/tables/array: .CMakeLists.txt.swp
> > +diff -u -r ibus-table-chinese-1.8.2/tables/cangjie/CMakeLists.txt new/=
tables/cangjie/CMakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/cangjie/CMakeLists.txt     2018-10=
-30 01:56:50.506773198 +0100
> > ++++ new/tables/cangjie/CMakeLists.txt  2018-10-30 00:15:41.319903050 +=
0100
> > +@@ -1,2 +1,2 @@
> > +-CONVERT_DB(cangjie "cangjie3.txt" "cangjie5.txt" "cangjie-big.txt")
> > ++CONVERT_DB(cangjie "${CMAKE_CURRENT_SOURCE_DIR}/cangjie3.txt" "${CMAK=
E_CURRENT_SOURCE_DIR}/cangjie5.txt" "${CMAKE_CURRENT_SOURCE_DIR}/cangjie-bi=
g.txt")
> > +
> > +Only in new/tables/cangjie: .CMakeLists.txt.swp
> > +diff -u -r ibus-table-chinese-1.8.2/tables/cantonese/CMakeLists.txt ne=
w/tables/cantonese/CMakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/cantonese/CMakeLists.txt   2018-10=
-30 01:56:29.464408649 +0100
> > ++++ new/tables/cantonese/CMakeLists.txt        2018-10-30 00:05:51.026=
038238 +0100
> > +@@ -1,2 +1,2 @@
> > +-CONVERT_DB(cantonese "cantonese.txt" "cantonhk.txt" "jyutping.txt")
> > ++CONVERT_DB(cantonese "${CMAKE_CURRENT_SOURCE_DIR}/cantonese.txt" "${C=
MAKE_CURRENT_SOURCE_DIR}/cantonhk.txt" "${CMAKE_CURRENT_SOURCE_DIR}/jyutpin=
g.txt")
> > +
> > +Only in new/tables/cantonese: .CMakeLists.txt.swp
> > +diff -u -r ibus-table-chinese-1.8.2/tables/CMakeLists.txt new/tables/C=
MakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/CMakeLists.txt     2018-10-30 01:5=
6:08.781947707 +0100
> > ++++ new/tables/CMakeLists.txt  2018-10-30 01:53:51.086824367 +0100
> > +@@ -87,7 +87,7 @@
> > +           DEPENDS ${_tabFile}
> > +           COMMENT "Building ${_tabName} table"
> > +           )
> > +-      LIST(APPEND _dependDb "${_dbF}")
> > ++      LIST(APPEND _dependDb "${CMAKE_CURRENT_BINARY_DIR}/${_dbF}")
> > +       IF(EXISTS "${CMAKE_SOURCE_DIR}/icons/${_tabName}.png")
> > +           LIST(APPEND _dependIcon "${CMAKE_SOURCE_DIR}/icons/${_tabNa=
me}.png")
> > +       ELSEIF(EXISTS "${CMAKE_SOURCE_DIR}/icons/${_tabName}.svg")
> > +Only in new/tables: .CMakeLists.txt.swp
> > +diff -u -r ibus-table-chinese-1.8.2/tables/easy/CMakeLists.txt new/tab=
les/easy/CMakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/easy/CMakeLists.txt        2018-10=
-30 01:56:35.966667250 +0100
> > ++++ new/tables/easy/CMakeLists.txt     2018-10-30 00:07:49.806217968 +=
0100
> > +@@ -1,2 +1,2 @@
> > +-CONVERT_DB(easy "easy-big.txt")
> > ++CONVERT_DB(easy "${CMAKE_CURRENT_SOURCE_DIR}/easy-big.txt")
> > +
> > +Only in new/tables/easy: .CMakeLists.txt.swp
> > +diff -u -r ibus-table-chinese-1.8.2/tables/erbi/CMakeLists.txt new/tab=
les/erbi/CMakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/erbi/CMakeLists.txt        2018-10=
-30 01:56:39.921608060 +0100
> > ++++ new/tables/erbi/CMakeLists.txt     2018-10-30 00:08:14.355641341 +=
0100
> > +@@ -1,2 +1,2 @@
> > +-CONVERT_DB(erbi "erbi.txt" "erbi-qs.txt")
> > ++CONVERT_DB(erbi "${CMAKE_CURRENT_SOURCE_DIR}/erbi.txt" "${CMAKE_CURRE=
NT_SOURCE_DIR}/erbi-qs.txt")
> > +
> > +Only in new/tables/erbi: .CMakeLists.txt.swp
> > +diff -u -r ibus-table-chinese-1.8.2/tables/quick/CMakeLists.txt new/ta=
bles/quick/CMakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/quick/CMakeLists.txt       2018-10=
-30 01:56:43.592624907 +0100
> > ++++ new/tables/quick/CMakeLists.txt    2018-10-30 00:14:13.643389364 +=
0100
> > +@@ -1,2 +1,2 @@
> > +-CONVERT_DB(quick "quick3.txt" "quick5.txt" "quick-classic.txt")
> > ++CONVERT_DB(quick "${CMAKE_CURRENT_SOURCE_DIR}/quick3.txt" "${CMAKE_CU=
RRENT_SOURCE_DIR}/quick5.txt" "${CMAKE_CURRENT_SOURCE_DIR}/quick-classic.tx=
t")
> > +
> > +Only in new/tables/quick: .CMakeLists.txt.swp
> > +diff -u -r ibus-table-chinese-1.8.2/tables/scj/CMakeLists.txt new/tabl=
es/scj/CMakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/scj/CMakeLists.txt 2018-10-30 01:5=
6:47.079691021 +0100
> > ++++ new/tables/scj/CMakeLists.txt      2018-10-30 00:00:14.404215150 +=
0100
> > +@@ -1,2 +1,2 @@
> > +-CONVERT_DB(scj "scj6.txt")
> > ++CONVERT_DB(scj "${CMAKE_CURRENT_SOURCE_DIR}/scj6.txt")
> > +
> > +Only in new/tables/scj: .CMakeLists.txt.swp
> > +diff -u -r ibus-table-chinese-1.8.2/tables/stroke5/CMakeLists.txt new/=
tables/stroke5/CMakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/stroke5/CMakeLists.txt     2018-10=
-30 01:56:32.727534736 +0100
> > ++++ new/tables/stroke5/CMakeLists.txt  2018-10-30 00:07:28.132024331 +=
0100
> > +@@ -1,2 +1,2 @@
> > +-CONVERT_DB(stroke5 "stroke5.txt")
> > ++CONVERT_DB(stroke5 "${CMAKE_CURRENT_SOURCE_DIR}/stroke5.txt")
> > +
> > +Only in new/tables/stroke5: .CMakeLists.txt.swp
> > +diff -u -r ibus-table-chinese-1.8.2/tables/wu/CMakeLists.txt new/table=
s/wu/CMakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/wu/CMakeLists.txt  2018-10-30 01:5=
6:53.921858589 +0100
> > ++++ new/tables/wu/CMakeLists.txt       2018-10-30 00:16:38.080698934 +=
0100
> > +@@ -1,2 +1,2 @@
> > +-CONVERT_DB(wu "wu.txt")
> > ++CONVERT_DB(wu "${CMAKE_CURRENT_SOURCE_DIR}/wu.txt")
> > +
> > +Only in new/tables/wu: .CMakeLists.txt.swp
> > +diff -u -r ibus-table-chinese-1.8.2/tables/wubi-haifeng/CMakeLists.txt=
 new/tables/wubi-haifeng/CMakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/wubi-haifeng/CMakeLists.txt       =
 2018-10-30 01:56:15.560132413 +0100
> > ++++ new/tables/wubi-haifeng/CMakeLists.txt     2018-10-29 23:30:12.746=
818405 +0100
> > +@@ -5,6 +5,6 @@
> > + #    COMMENT "Building wubi-haifeng86.UTF-8"
> > + #    )
> > +
> > +-MAKE_TABLE_SOURCE_TXT(wubi-haifeng86.txt wubi-haifeng86.head wubi-hai=
feng86.UTF-8 wubi-haifeng86.tail)
> > ++MAKE_TABLE_SOURCE_TXT(wubi-haifeng86.txt ${CMAKE_CURRENT_SOURCE_DIR}/=
wubi-haifeng86.head ${CMAKE_CURRENT_SOURCE_DIR}/wubi-haifeng86.UTF-8 ${CMAK=
E_CURRENT_SOURCE_DIR}/wubi-haifeng86.tail)
> > + CONVERT_DB(wubi-haifeng "wubi-haifeng86.txt")
> > +
> > +Only in new/tables/wubi-haifeng: .CMakeLists.txt.swp
> > +diff -u -r ibus-table-chinese-1.8.2/tables/wubi-jidian/CMakeLists.txt =
new/tables/wubi-jidian/CMakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/wubi-jidian/CMakeLists.txt 2018-10=
-30 01:56:25.921357528 +0100
> > ++++ new/tables/wubi-jidian/CMakeLists.txt      2018-10-30 00:01:13.876=
283460 +0100
> > +@@ -1,2 +1,2 @@
> > +-CONVERT_DB(wubi-jidian "wubi-jidian86.txt")
> > ++CONVERT_DB(wubi-jidian "${CMAKE_CURRENT_SOURCE_DIR}/wubi-jidian86.txt=
")
> > +
> > +Only in new/tables/wubi-jidian: .CMakeLists.txt.swp
> > +diff -u -r ibus-table-chinese-1.8.2/tables/yong/CMakeLists.txt new/tab=
les/yong/CMakeLists.txt
> > +--- ibus-table-chinese-1.8.2/tables/yong/CMakeLists.txt        2018-10=
-30 01:56:57.568881862 +0100
> > ++++ new/tables/yong/CMakeLists.txt     2018-10-30 00:17:30.326704114 +=
0100
> > +@@ -1,2 +1,2 @@
> > +-CONVERT_DB(yong "yong.txt")
> > ++CONVERT_DB(yong "${CMAKE_CURRENT_SOURCE_DIR}/yong.txt")
> > +
> > diff --git a/meta-oe/recipes-support/ibus/ibus-table-chinese_1.8.2.bb b=
/meta-oe/recipes-support/ibus/ibus-table-chinese_1.8.2.bb
> > new file mode 100644
> > index 000000000..0c33e4f44
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/ibus/ibus-table-chinese_1.8.2.bb
> > @@ -0,0 +1,82 @@
> > +DESCRIPTION =3D "It is a Japanese input engine for IBus."
> > +LICENSE =3D "GPLv3"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D86bfc594f9971fb2797f5aea1a4=
9d316"
> > +SECTION =3D "inputmethods"
> > +
> > +SRC_URI =3D "https://github.com/definite/${PN}/archive/${PV}.tar.gz \
> > +           file://0001-revert-CMakeLists.txt.patch \
> > +           file://0002-add-Modules.patch \
> > +           file://0003-add-ChangeLog.prev.patch \
> > +           file://0005-fix-cmake-cross-compile.patch \
> > +"
> > +
> > +SRC_URI[md5sum] =3D "6360649580363bb3627a11e32057f6b1"
> > +SRC_URI[sha256sum] =3D "ef62c22ef4e8f9085fc40fcbc14c30f6dac458817df98e=
9f90f883a3e2080089"
> > +
> > +inherit cmake
> > +
> > +DEPENDS =3D " ibus-table "
> > +
> > +BBCLASSEXTEND =3D "native"
> > +
> > +# The supported options are "Unix Makefiles" or "Ninja".
> > +OECMAKE_GENERATOR =3D "Unix Makefiles"
> > +
> > +cmake_do_generate_toolchain_file() {
> > +    if [ "${BUILD_SYS}" =3D "${HOST_SYS}" ]; then
> > +        cmake_crosscompiling=3D"set( CMAKE_CROSSCOMPILING FALSE )"
> > +    fi
> > +    cat > ${WORKDIR}/toolchain.cmake <<EOF
> > +# CMake system name must be something like "Linux".
> > +# This is important for cross-compiling.
> > +$cmake_crosscompiling
> > +set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e
> > +'s/^\(Linux\).*/\1/'` )
> > +set( CMAKE_SYSTEM_PROCESSOR
> > +${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
> > +set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
> > +set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
> > +set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
> > +set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
> > +set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
> > +set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
> > +set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
> > +set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING
> > +"Additional CFLAGS for release" )
> > +set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRI=
NG
> > +"Additional CXXFLAGS for release" )
> > +set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING
> > +"Additional ASM FLAGS for release" )
> > +set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING "LDFLAG=
S" )
> > +set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LD=
FLAGS" )
> > +
> > +# only search in the paths provided so cmake doesnt pick
> > +# up libraries and tools from the native build machine
> > +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE}
> > +${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH}
> > +${EXTERNAL_TOOLCHAIN})
> > +set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
> > +# set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${OECMAKE_FIND_ROOT_PATH_MODE=
_PROGRAM} )
> > +set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
> > +# set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
> > +
> > +# Use qt.conf settings
> > +set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
> > +
> > +# We need to set the rpath to the correct directory as cmake does not =
provide
> > +# any
> > +# directory as rpath by default
> > +set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
> > +
> > +# Use native cmake modules
> > +list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
> > +
> > +# add for non /usr/lib libdir, e.g. /usr/lib64
> > +set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
> > +
> > +EOF
> > +}
> > +
> > +FILES_${PN} +=3D "${datadir}/ibus-table/icons/* \
> > +    ${datadir}/ibus-table/tables/* \
> > +"
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

